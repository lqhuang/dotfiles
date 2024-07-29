#!/bin/bash

set -eu

BIN_FOLDER="${HOME}/.local/bin"
VERSION="latest"

PROJECT_REPO="bazelbuild/buildtools"
CLI_TOOLS=(
  buildifier
  buildozer
  unused_deps
)

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

for cli_name in "${CLI_TOOLS[@]}"; do
  if [[ "${VERSION:-}" == "latest" ]]; then
    release_url="https://github.com/${PROJECT_REPO}/releases/latest/download/${cli_name}-${PLATFORM}-${ARCH}"
  else
    release_url="https://github.com/${PROJECT_REPO}/releases/download/${VERSION}/${cli_name}-${PLATFORM}-${ARCH}"
  fi

  mkdir -p "${BIN_FOLDER}"
  echo "Downloading ${cli_name} from ${release_url}"

  if hash curl > /dev/null 2>&1; then
    curl "${release_url}" -o "${BIN_FOLDER}/${cli_name}" -fsSL --compressed ${CURL_OPTS:-}
  elif hash wget > /dev/null 2>&1; then
    wget ${WGET_OPTS:-} -qO "${BIN_FOLDER}/${cli_name}" "${release_url}"
  else
    echo "Neither curl nor wget was found" >&2
    exit 1
  fi

  chmod +x "${BIN_FOLDER}/${cli_name}"
  echo "${cli_name} has installed to ${BIN_FOLDER}/${cli_name}"
done
