#!/bin/sh

set -eu

BIN_FOLDER="${HOME}/.local/bin"
PREFIX_LOCATION="${HOME}/.conda"
VERSION="latest"

# Computing artifact location
case "$(uname)" in
  Linux)
    PLATFORM="linux"
    ;;
  Darwin)
    PLATFORM="osx"
    ;;
  *NT*)
    PLATFORM="win"
    ;;
esac

ARCH="$(uname -m)"
case "$ARCH" in
  aarch64 | ppc64le | arm64) ;; # pass
  *)
    ARCH="64"
    ;;
esac

case "$PLATFORM-$ARCH" in
  linux-aarch64 | linux-ppc64le | linux-64 | osx-arm64 | osx-64 | win-64) ;; # pass
  *)
    echo "Failed to detect your OS" >&2
    exit 1
    ;;
esac

if [[ "${VERSION:-}" == "latest" ]]; then
  RELEASE_URL="https://github.com/mamba-org/micromamba-releases/releases/latest/download/micromamba-${PLATFORM}-${ARCH}"
else
  RELEASE_URL="https://github.com/mamba-org/micromamba-releases/releases/download/micromamba-${VERSION}/micromamba-${PLATFORM}-${ARCH}"
fi

# Downloading artifact
mkdir -p "${BIN_FOLDER}"
if hash curl > /dev/null 2>&1; then
  curl "${RELEASE_URL}" -o "${BIN_FOLDER}/micromamba" -fsSL --compressed ${CURL_OPTS:-}
elif hash wget > /dev/null 2>&1; then
  wget ${WGET_OPTS:-} -qO "${BIN_FOLDER}/micromamba" "${RELEASE_URL}"
else
  echo "Neither curl nor wget was found" >&2
  exit 1
fi
chmod +x "${BIN_FOLDER}/micromamba"

if hash conda > /dev/null 2>&1; then
  echo "You have conda installed, do not soft link micromamba to conda"
else
  echo "No installed 'conda' founded, trying soft link micromamba to conda"
  ln -s "${BIN_FOLDER}/micromamba" "${BIN_FOLDER}/conda"
fi

echo "Successfully installed micromamba, add the following line to your shell configuration file:"
"${BIN_FOLDER}/micromamba" --dry-run shell init -p "${PREFIX_LOCATION}"
