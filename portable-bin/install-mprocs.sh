#!/bin/bash

set -eu -o pipefail

ARCH=linux64
# DISTRO=unknown-linux
# LIBC=musl # or gnu
VERSION="0.6.4"

NAME=mprocs
REPO=pvolok/mprocs
ASSET=mprocs-${VERSION}-${ARCH}.tar.gz
# ASSET=mprocs-${VERSION}.${ARCH}-${DISTRO}-${LIBC}.tar.xz

LATEST_URL=https://github.com/${REPO}/releases/latest/download/${ASSET}
VERSIONED_URL=https://github.com/${REPO}/releases/download/v${VERSION}/${ASSET}

TARGET_DIR=${HOME}/.local/bin

echo "Downloading from ${VERSIONED_URL}"

mkdir -p ${TARGET_DIR}
curl -L ${VERSIONED_URL} | tar -C ${TARGET_DIR} -xzf -

echo "Installed portable binary ${REPO} ${VERSION} to ${TARGET_DIR}"
command -v ${NAME}
[ $? -eq 0 ] && echo "$cmd command was installed successfully" || echo "$cmd failed"
