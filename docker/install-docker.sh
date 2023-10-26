#!/bin/sh

set -eu -o pipefail

# Install using the convenience script
export DOWNLOAD_URL="https://mirrors.tuna.tsinghua.edu.cn/docker-ce"
wget -O- https://get.docker.com/ | sudo -E sh

# If you prefer to use Docker as a non-root user
# and notice that DO NOT SUGGEST TO RUN THESE BY ROOT USER
sudo apt-get install -y uidmap
dockerd-rootless-setuptool.sh install
