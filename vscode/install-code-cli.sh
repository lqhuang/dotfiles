#!/bin/bash
# Reference and inspired
# https://aur.archlinux.org/packages/visual-studio-code-bin

set -eu -o pipefail

# deps required by vscode for Arch / Manjaro
# (at-spi2-core alsa-lib gtk3 libcups)

APP="vscode-linux-cli-x64"
SOURCE_URL="https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64"
FNAME="vscode-cli-alpine-x64-cli.tar.gz"
# TARGET_DIR=${HOME}/Downloads
TARGET_DIR="/tmp"
INSTALL_DIR="${HOME}/.local/bin"

mkdir -p "${TARGET_DIR}"
curl -fSL "${SOURCE_URL}" -o "${TARGET_DIR}/${FNAME}"

mkdir -p "${INSTALL_DIR}"
tar -xzf "${TARGET_DIR}/${FNAME}" -C "${INSTALL_DIR}"

# --overwrite
# -k, --keep-old-files
