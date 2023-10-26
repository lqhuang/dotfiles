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
