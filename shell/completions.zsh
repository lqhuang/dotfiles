#
# Which completions to load for the shell.
#
# This file is sourced by zim and should be sourced before the completion module.
#
SHELL_NAME="${SHELL##*/}"  # zsh / bash

# pnpm
# export PNPM_HOME="${HOME}/Library/pnpm"
export PNPM_HOME="${HOME}/.local/share/pnpm"
if [[ -d "${PNPM_HOME}" ]]; then
  export PATH="${PNPM_HOME}:${PATH}"
fi
### TOO SLOW to load pnpm completions
# if [[ -s $(command -v pnpm) ]]; then
#   source <(pnpm completion ${SHELL_NAME})
# fi

if [[ -s "~/.cache/mill/download/mill-completion.sh" ]]; then
  source ~/.cache/mill/download/mill-completion.sh # MILL_SOURCE_COMPLETION_LINE
fi

# # >>> scala completions >>>
# fpath=("/Users/lqhuang/Library/Application Support/ScalaCli/completions/zsh" $fpath)
# compinit
# # <<< scala completions <<<
