######################## Env Setup ############################################
KERNEL_NAME=$(uname -s)  # Linux / Darwin
ARCH_NAME=$(uname -m)  # x86_64 / arm64

# BREW_PREFIX=$(brew --prefix)
if [[ ${KERNEL_NAME} == "Darwin" ]]; then
  if [[ ${ARCH_NAME} == 'x86_64' ]]; then
    BREW_PREFIX="/usr/local"
  else
    BREW_PREFIX="/opt/homebrew"
  fi
fi

if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then

fi

######################## ZSH Opts ##############################################
# https://zsh.sourceforge.io/Doc/Release/Options.html
setopt noflowcontrol

bindkey "\eq" push-line-or-edit

######################## ZSH Plugins ##############################################

# ## auto completion (obviously not required under oh-my-zsh)
# ## https://zsh.sourceforge.io/Doc/Release/Completion-System.html
autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit
zstyle ':completion:*' menu select                              # Set few items style
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path
# ## Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
# zstyle ':completion:*' cache-path ${ZSH}/cache

## Plugins section: Enable fish style features
### Use syntax highlighting: zsh-syntax-highlighting.zsh
### Use history substring search: zsh-history-substring-search.zsh
### Use autosuggestion: zsh-autosuggestions.zsh
if [[ ${KERNEL_NAME} == "Linux" ]]; then
  if [[ -s /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    # source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  fi
elif [[ ${KERNEL_NAME} == "Darwin" ]]; then
  if [[ -s ${BREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source ${BREW_PREFIX}/share/zsh-history-substring-search/zsh-history-substring-search.zsh
    source ${BREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  fi
fi

# # terraform
# TERRAFORM=$(command -v terraform)
# if [[ -x "${TERRAFORM}" ]]; then
#   # oh-my-zsh has loaded `bashcompinit` already
#   # autoload -U +X bashcompinit && bashcompinit
#   complete -o nospace -C ${TERRAFORM} terraform
# fi

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
      source /usr/share/doc/fzf/examples/completion.zsh
      # source /usr/share/doc/fzf/examples/key-bindings.zsh
    else
      source /usr/share/fzf/completion.zsh
      # source /usr/share/fzf/key-bindings.zsh
    fi
  elif [[ ${KERNEL_NAME} == "Darwin" ]]; then
    source ${BREW_PREFIX}/opt/fzf/shell/completion.zsh
    # source ${BREW_PREFIX}/opt/fzf/shell/key-bindings.zsh
  fi
fi

## miniconda
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('"'"${HOME}"'"/Software/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
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
  source ${HOME}/.shared_profile
fi