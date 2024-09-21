######################## Env Setup ############################################
KERNEL_NAME=$(uname -s)  # Linux / Darwin
ARCH_NAME=$(uname -m)  # x86_64 / arm64

## Homebrew
if [[ ${KERNEL_NAME} == "Darwin" ]]; then
  # export HOMEBREW_SIMULATE_MACOS_ON_LINUX=1

  # The variables `HOMEBREW_PREFIX`, `HOMEBREW_CELLAR` and `HOMEBREW_REPOSITORY`
  # are also exported to avoid querying them multiple times.
  # HOMEBREW_PREFIX=$(brew --prefix)
  export HOMEBREW_PREFIX="/opt/homebrew"
  export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
  export HOMEBREW_REPOSITORY="/opt/homebrew"
  export HOMEBREW_NO_ANALYTICS=1

  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"
  export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
  export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

  # __HOST="https://mirrors.tuna.tsinghua.edu.cn"
  __HOST="https://mirrors.ustc.edu.cn"
  export HOMEBREW_API_DOMAIN="${__HOST}/homebrew-bottles/api"
  export HOMEBREW_BOTTLE_DOMAIN="${__HOST}/homebrew-bottles"
  # export HOMEBREW_BREW_GIT_REMOTE="${__HOST}/git/homebrew/brew.git"
  # export HOMEBREW_CORE_GIT_REMOTE="${__HOST}/git/homebrew/homebrew-core.git"

  # export HOMEBREW_PIP_INDEX_URL="https://pypi.tuna.tsinghua.edu.cn/simple"
fi

if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
  export ZSH="${HOME}/.oh-my-zsh"
  if [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]; then
    # ZSH_THEME="fishy"
    export ZSH_THEME="ys"
  else
    export ZSH_THEME="af-magic"
  fi
  source $ZSH/oh-my-zsh.sh

else
  # ==== ZSH Opts ====
  # https://zsh.sourceforge.io/Doc/Release/Options.html
  setopt noflowcontrol
  setopt correct
  bindkey "\eq" push-line-or-edit

  # ==== ZSH Plugins ====
  # ## auto completion (obviously not required under oh-my-zsh)
  # ## https://zsh.sourceforge.io/Doc/Release/Completion-System.html
  autoload -U +X bashcompinit && bashcompinit
  autoload -Uz compinit
  zstyle ':completion:*' menu select                              # Set few items style
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
  zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
  zstyle ':completion:*' rehash true
  # ## Speed up completions
  zstyle ':completion:*' accept-exact '*(N)'
  zstyle ':completion:*' use-cache on
  # zstyle ':completion:*' cache-path ${ZSH}/cache

  # ==== Aliases ====
  alias lsa='ls -lah'
  alias l='ls -lah'
  alias ll='ls -lh'
  alias la='ls -lAh'

  EXC_FOLDERS="{.bzr,CVS,.git,.hg,.svn,.idea,.tox}"
  GREP_OPTIONS="--color=auto --exclude-dir=$EXC_FOLDERS"
  alias grep="grep ${GREP_OPTIONS}"
  alias egrep="egrep ${GREP_OPTIONS}"
  alias fgrep="fgrep ${GREP_OPTIONS}"
fi

# ######################## ZSH Opts ##############################################
# # https://zsh.sourceforge.io/Doc/Release/Options.html
# setopt noflowcontrol

# bindkey "\eq" push-line-or-edit

# ######################## ZSH Plugins ##############################################

# # ## auto completion (obviously not required under oh-my-zsh)
# # ## https://zsh.sourceforge.io/Doc/Release/Completion-System.html
# autoload -U +X bashcompinit && bashcompinit
# autoload -Uz compinit
# zstyle ':completion:*' menu select                              # Set few items style
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
# zstyle ':completion:*' rehash true                              # automatically find new executables in path
# # ## Speed up completions
# zstyle ':completion:*' accept-exact '*(N)'
# zstyle ':completion:*' use-cache on
# # zstyle ':completion:*' cache-path ${ZSH}/cache

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
  if [[ -s ${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source ${HOMEBREW_PREFIX}/share/zsh-history-substring-search/zsh-history-substring-search.zsh
    source ${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  fi
fi

# # terraform
# TERRAFORM=$(command -v terraform)
# if [[ -x "${TERRAFORM}" ]]; then
#   # oh-my-zsh has loaded `bashcompinit` already
#   # autoload -U +X bashcompinit && bashcompinit
#   complete -o nospace -C ${TERRAFORM} terraform
# fi

# ######################## Aliases ############################################
# alias lsa='ls -lah'
# alias l='ls -lah'
# alias ll='ls -lh'
# alias la='ls -lAh'

# EXC_FOLDERS="{.bzr,CVS,.git,.hg,.svn,.idea,.tox}"
# GREP_OPTIONS="--color=auto --exclude-dir=$EXC_FOLDERS"
# alias grep="grep ${GREP_OPTIONS}"
# alias egrep="egrep ${GREP_OPTIONS}"
# alias fgrep="fgrep ${GREP_OPTIONS}"

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
    source ${HOMEBREW_PREFIX}/opt/fzf/shell/completion.zsh
    # source ${HOMEBREW_PREFIX}/opt/fzf/shell/key-bindings.zsh
  fi
fi

# Set the `auto_activate_base` parameter to `false` after installation,
# which makes base environment not be activated on startup.
# > conda config --set auto_activate_base false

######################## Source Common ############################################
[[ -s "${HOME}/Git/dotfiles/home/.shared_profile" ]] && source ${HOME}/Git/dotfiles/home/.shared_profile
