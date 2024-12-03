#
# Python
#
SHELL_NAME="${SHELL##*/}"  # zsh / bash

# # miniconda
#
# # Set the `auto_activate_base` parameter to `false` after installation,
# # which makes base environment not be activated on startup.
# # > conda config --set auto_activate_base false
#
# if [[ -d "${HOME}/Software/miniconda3" ]]; then
#   # >>> conda initialize >>>
#   # !! Contents within this block are managed by 'conda init' !!
#   __conda_setup="$('"'"${HOME}"'"/Software/miniconda3/bin/conda' shell.${SHELL_NAME} 'hook' 2> /dev/null)"
#   if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
#   else
#     if [ -f "${HOME}/Software/miniconda3/etc/profile.d/conda.sh" ]; then
#       . "${HOME}/Software/miniconda3/etc/profile.d/conda.sh"
#     else
#       export PATH="${HOME}/Software/miniconda3/bin:${PATH}"
#     fi
#   fi
#   unset __conda_setup
#   # <<< conda initialize <<<
# fi

# micromamba
if hash micromamba > /dev/null 2>&1; then

  # # >>> mamba initialize >>>
  # # !! Contents within this block are managed by 'micromamba shell init' !!
  # export MAMBA_EXE='/opt/homebrew/bin/micromamba';
  # export MAMBA_ROOT_PREFIX='/opt/homebrew';
  # __mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
  # if [ $? -eq 0 ]; then
  #     eval "$__mamba_setup"
  # else
  #     alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
  # fi
  # unset __mamba_setup
  # # <<< mamba initialize <<<

  export MAMBA_ROOT_PREFIX="${HOME}/.conda"
  # register shell completion
  source <(micromamba shell hook --shell "${SHELL_NAME}" --root-prefix "${MAMBA_ROOT_PREFIX}")
  alias conda="micromamba"
fi

# uv
if hash uv > /dev/null 2>&1; then
  # completions are registered by brew already
  #source <(uv generate-shell-completion ${SHELL_NAME})
  #source <(uvx --generate-shell-completion ${SHELL_NAME})
fi
