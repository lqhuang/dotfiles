#!/bin/bash

set -eu -o pipefail

ARCH=x86_64 # aarch64
DISTRO=unknown-linux
VERSION=v1.15.3
# VERSION=v1.14.3

LIBC=musl # or gnu

REPO=shadowsocks/shadowsocks-rust
ASSET=shadowsocks-${VERSION}.${ARCH}-${DISTRO}-${LIBC}.tar.xz

LATEST_URL=https://github.com/${REPO}/releases/latest/download/${ASSET}
VERSIONED_URL=https://github.com/${REPO}/releases/download/${VERSION}/${ASSET}

TARGET_DIR=${HOME}/.local/bin

mkdir -p ${TARGET_DIR}
curl -L ${VERSIONED_URL} | tar -C ${TARGET_DIR} -xJf -
