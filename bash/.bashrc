# export https_proxy=http://localhost:7890

######################## BASH Plugins ##############################################

# completion
# [[ -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

TERRAFORM=$(command -v terraform)
[[ -x ${TERRAFORM} ]] && complete -C ${TERRAFORM} terraform

######################## Aliases ############################################
alias l='ls -lah'                         # compact view, show hidden files

########################## Software Init ######################################

## miniconda
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('"'"${HOME}"'"/Software/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "${HOME}/Software/miniconda3/etc/profile.d/conda.sh" ]; then
    . "${HOME}/Software/miniconda3/etc/profile.d/conda.sh"
  else
    export PATH="${HOME}/Software/miniconda3/bin:${PATH}"
  fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Set the `auto_activate_base` parameter to `false` after installation,
# which makes base environment not be activated on startup.
# > conda config --set auto_activate_base false

######################## Source Common ############################################
if [[ -f "${HOME}/.profile" ]]; then
  . ${HOME}/.profile
  # echo "faster"
fi
