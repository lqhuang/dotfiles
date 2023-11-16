#!/bin/bash

set -eu -o pipefail

ARCH=amd64v3
DISTRO=linux
# LIBC=musl # or gnu
VERSION="1.6.4"

NAME=sing-box
REPO=SagerNet/sing-box
ASSET=${NAME}-${VERSION}-${DISTRO}-${ARCH}.tar.gz

# example url:
# https://github.com/SagerNet/sing-box/releases/download/v1.6.4/sing-box-1.6.4-linux-amd64v3.tar.gz
LATEST_URL=https://github.com/${REPO}/releases/latest/download/${ASSET}
VERSIONED_URL=https://github.com/${REPO}/releases/download/v${VERSION}/${ASSET}

TARGET_DIR=${HOME}/.local/bin

echo "${REPO} ${VERSION}: Downloading from ${VERSIONED_URL} and extracting binary to ${TARGET_DIR}..."
mkdir -p ${TARGET_DIR}
curl -L ${VERSIONED_URL} | tar -C ${TARGET_DIR} -xzf -

echo "Testing installation of ${NAME}"
command -v ${NAME}

