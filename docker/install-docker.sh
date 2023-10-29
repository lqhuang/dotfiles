#!/bin/sh
set -eu -o pipefail

# Install using the convenience script
export DOWNLOAD_URL="https://mirrors.tuna.tsinghua.edu.cn/docker-ce"
wget -O- https://get.docker.com/ | sudo -E sh
