# Container Registry

## Docker Hub

Edit `"registry-mirrors"` key in `/etc/docker/daemon.json`:

```json
{
  "registry-mirrors": [
    "https://docker.mirrors.sjtug.sjtu.edu.cn",
    "https://docker.nju.edu.cn",
    "https://dockerproxy.com"
  ]
}
```

- [SJTUG Mirror: docker-registry](https://mirrors.sjtug.sjtu.edu.cn/docs/docker-registry)
- [NJU Mirror: docker-hub Documentation](https://mirror.nju.edu.cn/help/docker-hub)

## Reverse Proxy for ghcr.io / gcr.io / quay.io / k8s.gcr.io

- \_/
  - dockerproxy.com
- ghcr.io
  - ghcr.nju.edu.cn
  - ghcr.dockerproxy.com
- gcr.io
  - gcr.nju.edu.cn
  - gcr.dockerproxy.com
- k8s.gcr.io
  - gcr.nju.edu.cn/google-containers
  - k8s-gcr-io.mirrors.sjtug.sjtu.edu.cn
  - k8s.dockerproxy.com
- quay.io
  - quay.nju.edu.cn
  - quay.mirrors.ustc.edu.cn
  - quay.dockerproxy.com

### Ref

- [Mirrors from NJU](https://doc.nju.edu.cn/books/35f4a/page/ghcr)
- [Mirrors from SJTUG](https://mirrors.sjtug.sjtu.edu.cn/docs/gcr.io)
- [Docker Proxy](https://dockerproxy.com): 多平台容器镜像代理服务, 支持 Docker
  Hub, GitHub, Google, k8s, Quay 等镜像仓库

## Install on WSL2 without sleep after warning

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sed -i 's/( set -x; sleep 20 )/#( set -x; sleep 20 )/g' get
sh get-docker.sh
```
