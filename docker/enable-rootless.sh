#!/bin/bash

set -eu -o pipefail

# If you prefer to use Docker as a non-root user
# and notice that DO NOT SUGGEST TO RUN THESE BY ROOT USER
sudo apt-get install -y uidmap slirp4netns
dockerd-rootless-setuptool.sh install

# The systemd unit file is installed as `~/.config/systemd/user/docker.service`.
systemctl --user enable docker
systemctl --user start docker
sudo loginctl enable-linger $(whoami)

# To specify the CLI context using `docker context`
docker context ls
# NAME         DESCRIPTION                               DOCKER ENDPOINT                     ERROR
# default      Current DOCKER_HOST based configuration   unix:///var/run/docker.sock
# rootless *   Rootless mode                             unix:///run/user/1001/docker.sock

# docker context use rootless
