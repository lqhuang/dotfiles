# Docker Hub Proxy

Proxy for Docker Hub in China.

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
