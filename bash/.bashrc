######################## Env Setup ############################################
KERNEL_NAME=$(uname -s)  # Linux / Darwin
ARCH_NAME=$(uname -m)  # x86_64 / arm64

if [[ ${KERNEL_NAME} == "Darwin" ]]; then
  if [[ ${ARCH_NAME} == 'x86_64' ]]; then
    BREW_PREFIX="/usr/local"
  else
    BREW_PREFIX="/opt/homebrew"
  fi
fi

######################## BASH Opts ##############################################
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

######################## BASH Plugins ##############################################
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [[ ${KERNEL_NAME} == "Linux" ]]; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# # terraform
# TERRAFORM=$(command -v terraform)
# [[ -x ${TERRAFORM} ]] && complete -C ${TERRAFORM} terraform

######################## Aliases ############################################
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

EXC_FOLDERS="{.bzr,CVS,.git,.hg,.svn,.idea,.tox}"
GREP_OPTIONS="--color=auto --exclude-dir=$EXC_FOLDERS"
alias grep="grep ${GREP_OPTIONS}"
alias egrep="egrep ${GREP_OPTIONS}"
alias fgrep="fgrep ${GREP_OPTIONS}"

########################## Software Init ######################################
## fzf
if [[ -x $(command -v fzf) ]]; then
  if [[ ${KERNEL_NAME} == "Linux" ]]; then
    source /usr/share/doc/fzf/examples/completion.bash
    # source /usr/share/doc/fzf/examples/key-bindings.bash
  elif [[ ${KERNEL_NAME} == "Darwin" ]]; then
    source ${BREW_PREFIX}/opt/fzf/shell/completion.bash
    # source ${BREW_PREFIX}/opt/fzf/shell/key-bindings.bash
  fi
fi

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
if [[ -f "${HOME}/.shared_profile" ]]; then
  . ${HOME}/.shared_profile
  # echo "faster"
fi
