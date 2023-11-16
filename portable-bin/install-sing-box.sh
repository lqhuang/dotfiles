#!/bin/bash

set -eu -o pipefail

ARCH=amd64v3
DISTRO=linux
# LIBC=musl # or gnu
VERSION="1.6.4"

REPO=SagerNet/sing-box
NAME=sing-box
RAW_CLI_NAME="${NAME}-${VERSION}-${DISTRO}-${ARCH}" # example: sing-box-1.6.4-linux-amd64v3
ASSET="${RAW_CLI_NAME}.tar.gz"

# example url:
# https://github.com/SagerNet/sing-box/releases/download/v1.6.4/sing-box-1.6.4-linux-amd64v3.tar.gz
LATEST_URL=https://github.com/${REPO}/releases/latest/download/${ASSET}
VERSIONED_URL=https://github.com/${REPO}/releases/download/v${VERSION}/${ASSET}

TARGET_DIR=${HOME}/.local/bin

echo "${REPO} ${VERSION}: Downloading from ${VERSIONED_URL} and extracting binary to ${TARGET_DIR}..."
mkdir -p ${TARGET_DIR}
curl -L ${VERSIONED_URL} | tar -C ${TARGET_DIR} -xzf -

mv ${TARGET_DIR}/${RAW_CLI_NAME} ${TARGET_DIR}/${NAME}
chmod u+x ${TARGET_DIR}/${NAME}

echo "Testing installation of ${NAME}"
command -v ${NAME}
[ $? -eq 0 ] && echo "$cmd command was installed successfully" || echo "$cmd failed"
