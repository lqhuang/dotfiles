#!/bin/sh

echo "Current HOME directory for User ${USER} is: ${HOME}"
echo "Installing UV to ${HOME}/.local"

mkdir -p "${HOME}/.local"
curl -LsSf https://astral.sh/uv/install.sh | env UV_INSTALL_DIR="${HOME}/.local" INSTALLER_NO_MODIFY_PATH=1 sh
