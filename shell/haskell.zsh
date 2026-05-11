KERNEL_NAME=$(uname -s)  # Linux / Darwin
SHELL_NAME="${SHELL##*/}"  # zsh / bash

#
# Haskell
#

if [[ ${KERNEL_NAME} == "Linux" ]]; then
  # ghcup-env
  [ -f "/home/lqhuang/.ghcup/env" ] && . "/home/lqhuang/.ghcup/env"
fi
