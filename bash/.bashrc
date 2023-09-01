######################## Env Setup ############################################
KERNEL_NAME=$(uname -s)  # Linux / Darwin
ARCH_NAME=$(uname -m)  # x86_64 / arm64

## Homebrew
if [[ ${KERNEL_NAME} == "Darwin" ]]; then
  # BREW_PREFIX=$(brew --prefix)
  export HOMEBREW_PREFIX="/opt/homebrew"
  export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
  export HOMEBREW_REPOSITORY="/opt/homebrew"
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"
  export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
  export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

  export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
  export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
  # export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
  # export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
fi

export BASH_SILENCE_DEPRECATION_WARNING=1 # for macOS

# set a fancy prompt
case "$TERM" in
  xterm-color | *-256color)
    if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
      PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
      # If this is an xterm set the title to user@host:dir
      PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    fi
    ;;
esac

######################## BASH Opts ##############################################
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
# shopt -s globstar

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
elif [[ ${KERNEL_NAME} == "Darwin" ]]; then
  [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]] && . "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
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
    DISTRO=$(lsb_release -is)
    if [[ ${DISTRO} == "Debian" ]]; then
      source /usr/share/doc/fzf/examples/completion.bash
      # source /usr/share/doc/fzf/examples/key-bindings.bash
    else
      source /usr/share/fzf/completion.bash
      # source /usr/share/fzf/key-bindings.bash
    fi
  elif [[ ${KERNEL_NAME} == "Darwin" ]]; then
    source ${HOMEBREW_PREFIX}/opt/fzf/shell/completion.bash
    # source ${HOMEBREW_PREFIX}/opt/fzf/shell/key-bindings.bash
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
if [[ -f "${HOME}/Git/dotfiles/.shared_profile" ]]; then
  . ${HOME}/Git/dotfiles/.shared_profile
  # echo "faster"
fi
