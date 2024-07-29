#!/bin/sh

set -eu

BIN_FOLDER="${HOME}/.local/bin"
VERSION="latest"

# Computing artifact suffix
case "$(uname)" in
  Linux)
    PLATFORM="linux"
    ;;
  Darwin)
    PLATFORM="darwin"
    ;;
  *NT*)
    PLATFORM="windows"
    ;;
esac

ARCH="$(uname -m)"
case "$ARCH" in
  aarch64 | arm64)
    ARCH="arm64"
    ;;
  *)
    ARCH="amd64"
    ;;
esac

case "$PLATFORM-$ARCH" in
  linux-amd64 | linux-arm64 | darwin-amd64 | darwin-arm64 | windows-amd64) ;; # pass
  *)
    echo "Failed to detect your OS" >&2
    exit 1
    ;;
esac

if [[ "${VERSION:-}" == "latest" ]]; then
  RELEASE_URL="https://github.com/bazelbuild/bazelisk/releases/latest/download/bazelisk-${PLATFORM}-${ARCH}"
else
  RELEASE_URL="https://github.com/bazelbuild/bazelisk/releases/download/${VERSION}/bazelisk-${PLATFORM}-${ARCH}"
fi

# Downloading artifact
mkdir -p "${BIN_FOLDER}"
if hash curl > /dev/null 2>&1; then
  curl "${RELEASE_URL}" -o "${BIN_FOLDER}/bazelisk" -fsSL --compressed ${CURL_OPTS:-}
elif hash wget > /dev/null 2>&1; then
  wget ${WGET_OPTS:-} -qO "${BIN_FOLDER}/bazelisk" "${RELEASE_URL}"
else
  echo "Neither curl nor wget was found" >&2
  exit 1
fi
chmod +x "${BIN_FOLDER}/bazelisk"

if hash bazel > /dev/null 2>&1; then
  echo "You have 'bazel' installed, do not soft link 'bazelisk' to 'bazel'"
else
  echo "No installed 'bazel' founded, trying soft link 'bazelisk' to 'bazel'"
  ln -s "${BIN_FOLDER}/bazelisk" "${BIN_FOLDER}/conda"
fi
