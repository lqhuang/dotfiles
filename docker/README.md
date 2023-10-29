# Docker

## Mirrors for Docker Hub in China.

Edit `/etc/docker/daemon.json` with:

```json
{
  "registry-mirrors": [
    "https://docker.mirrors.sjtug.sjtu.edu.cn",
    "https://docker.nju.edu.cn"
  ]
}
```

Restart your docker service by `systemctl` to apply.

## Behind a proxy

**NOTE**: Proxy behavior for the daemon in the `daemon.json` file will override
the default `docker.service` systemd file.

### Regular setup

Using environment variables for docker service

```sh
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo cat <<EOF > /etc/systemd/system/docker.service.d/http-proxy.conf
[Service]
Environment="HTTP_PROXY=http://proxy.example.com:3128"
Environment="HTTPS_PROXY=https://proxy.example.com:3129"
Environment="NO_PROXY=localhost,127.0.0.1,docker-registry.example.com,.corp"
EOF

sudo systemctl daemon-reload
sudo systemctl restart docker
sudo systemctl show --property=Environment docker
```

### Rootless mode

The location of systemd configuration files are different when running Docker in
rootless mode. When running in rootless mode, Docker is started as a user-mode
systemd service, and uses files stored in each users' home directory in
`~/.config/systemd/user/docker.service.d/`

```sh

mkdir -p ${HOME}/.config/systemd/user/docker.service.d/

cat <<EOF > ${HOME}/.config/systemd/user/docker.service.d/http-proxy.conf
[Service]
Environment="HTTP_PROXY=http://proxy.example.com:3128"
Environment="HTTPS_PROXY=https://proxy.example.com:3129"
Environment="NO_PROXY=localhost,127.0.0.1,docker-registry.example.com,.corp"
EOF
```

In addition, `systemctl` must be executed without `sudo` and with the `--user`
flag.

```shell
systemctl --user daemon-reload
systemctl --user restart docker
systemctl --user show --property=Environment docker
```

## Tips for rootless mode

### The daemon does not start up automatically

You need `sudo loginctl enable-linger $(whoami)` to enable the daemon to start
up automatically. See Usage.

### Exposing privileged ports

To expose privileged ports (< 1024), set `CAP_NET_BIND_SERVICE` on `rootlesskit`
binary and restart the daemon.

```sh
sudo setcap cap_net_bind_service=ep $(which rootlesskit)
systemctl --user restart docker
```

Or add `net.ipv4.ip_unprivileged_port_start=0` to `/etc/sysctl.conf` (or
`/etc/sysctl.d`) and run `sudo sysctl --system`.

### Network is slow

Docker with rootless mode uses slirp4netns as the default network stack if
slirp4netns v0.4.0 or later is installed. If slirp4netns is not installed,
Docker falls back to VPNKit.

Also, changing MTU value may improve the throughput. The MTU value can be
specified by creating `~/.config/systemd/user/docker.service.d/override.conf`
with the following content:

```conf
[Service]
Environment="DOCKERD_ROOTLESS_ROOTLESSKIT_MTU=INTEGER"
```

```sh
systemctl --user daemon-reload
systemctl --user restart docker
```

### `docker run -p` does not propagate source IP addresses

This is because Docker with rootless mode uses RootlessKit's builtin port driver
by default.

The source IP addresses can be propagated by creating
`~/.config/systemd/user/docker.service.d/override.conf` with the following
content:

```conf
[Service]
Environment="DOCKERD_ROOTLESS_ROOTLESSKIT_PORT_DRIVER=slirp4netns"
```

Note that this configuration decreases throughput.
