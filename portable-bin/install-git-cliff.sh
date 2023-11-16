#!/bin/bash

set -eu -o pipefail

ARCH=x86_64
DISTRO=unknown-linux
LIBC=musl # or gnu
VERSION="1.2.0"

NAME=git-cliff
REPO=orhun/git-cliff
ASSET=${NAME}-${VERSION}-${ARCH}-${DISTRO}-${LIBC}.tar.gz

LATEST_URL=https://github.com/${REPO}/releases/latest/download/${ASSET}
VERSIONED_URL=https://github.com/${REPO}/releases/download/v${VERSION}/${ASSET}

TARGET_DIR=${HOME}/.local/bin

echo "${REPO} ${VERSION}: Downloading from ${VERSIONED_URL} and extracting binary to ${TARGET_DIR}..."
mkdir -p ${TARGET_DIR}
curl -L ${VERSIONED_URL} | tar -C ${TARGET_DIR} -xzf -

echo "Testing installation of ${NAME}"
command -v ${NAME}
[ $? -eq 0 ] && echo "$cmd command was installed successfully" || echo "$cmd failed"
