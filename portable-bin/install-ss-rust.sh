#!/bin/bash

set -eu -o pipefail

ARCH=x86_64 # aarch64
DISTRO=unknown-linux
VERSION=v1.15.3
# VERSION=v1.14.3

LIBC=musl # or gnu

CLI_NAME=ssservice
REPO=shadowsocks/shadowsocks-rust
ASSET=shadowsocks-${VERSION}.${ARCH}-${DISTRO}-${LIBC}.tar.xz

LATEST_URL=https://github.com/${REPO}/releases/latest/download/${ASSET}
VERSIONED_URL=https://github.com/${REPO}/releases/download/${VERSION}/${ASSET}

TARGET_DIR=${HOME}/.local/bin

mkdir -p ${TARGET_DIR}
curl -L ${VERSIONED_URL} | tar -C ${TARGET_DIR} -xJf -

echo "Testing installation of ${CLI_NAME}"
command -v ${CLI_NAME}
[ $? -eq 0 ] && echo "${CLI_NAME} command was installed successfully" || echo "${CLI_NAME} failed"
