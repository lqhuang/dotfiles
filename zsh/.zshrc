if [[ -n ${ZSH_PROF} ]]; then
  zmodload zsh/zprof
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will # load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
  # ZSH_THEME="robbyrussell"
  # Do not set ZSH_THEME when using Wrap Terminal
  if [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]; then
    # ZSH_THEME="fishy"
    ZSH_THEME="ys"
  else
    ZSH_THEME="af-magic"
  fi
fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


######################## Env Setup ############################################
KERNEL_NAME=$(uname -s)  # Linux / Darwin
ARCH_NAME=$(uname -m)  # x86_64 / arm64

## set locale config
export LC_ALL=en_US.UTF-8

## set visual and editor
export VISUAL=vim
export EDITOR="${VISUAL}"

# BREW_PREFIX=$(brew --prefix)
if [[ ${KERNEL_NAME} == "Darwin" ]]; then
  if [[ ${ARCH_NAME} == 'x86_64' ]]; then
    BREW_PREFIX="/usr/local"
  else
    BREW_PREFIX="/opt/homebrew"
  fi
fi

# inspired from manjaro `.zshrc` configuration
# setopt correct                            # Auto correct mistakes

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

######################## Plugins ##############################################

## auto completion
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path
## Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ${ZSH}/cache

# if (( $+commands[terraform] )); then
#   TERRAFORM=$(which terraform)
#   ## Load completion for terraform
#   autoload -U +X bashcompinit && bashcompinit
#   complete -o nospace -C ${TERRAFORM} terraform
# fi

## Plugins section: Enable fish style features
### Use syntax highlighting: zsh-syntax-highlighting.zsh
### Use history substring search: zsh-history-substring-search.zsh
### Use autosuggestion: zsh-autosuggestions.zsh
if [[ ${KERNEL_NAME} == "Linux" ]]; then
  if [[ -f /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    # source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  fi
elif [[ ${KERNEL_NAME} == "Darwin" ]]; then
  if [[ -f ${BREW_PREFIX}/share/zsh-history-substring-search/zsh-history-substring-search.zsh ]]; then
    source ${BREW_PREFIX}/share/zsh-history-substring-search/zsh-history-substring-search.zsh
    source ${BREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  fi
fi

## extract - archive extractor
## usage: extract <file>
extract () {
  if [[ -f $1 ]]; then
    case $1 in
      *.tar.bz2)   tar xjf $1    ;;
      *.tar.gz)    tar xzf $1    ;;
      *.tar.xz)    tar xJf $1    ;;
      *.bz2)       bunzip2 $1    ;;
      *.rar)       unrar x $1    ;;
      *.gz)        gunzip $1     ;;
      *.tar)       tar xf $1     ;;
      *.tbz2)      tar xjf $1    ;;
      *.tgz)       tar xzf $1    ;;
      *.zip)       unzip $1      ;;
      *.Z)         uncompress $1 ;;
      *.7z)        7z x $1       ;;
      *)           echo "'$1' cannot be extracted via exract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


########################## Software Init ######################################

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

if [[ ${KERNEL_NAME} == "Linux" ]] && [[ -s "${HOME}/.pyenv" ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  # eval "$(pyenv virtualenv-init -)"
fi

## Homebrew
if [[ ${KERNEL_NAME} == "Darwin" ]]; then
  [[ ${ARCH_NAME} == "arm64" ]] && export PATH="${BREW_PREFIX}/bin:${BREW_PREFIX}/sbin:${PATH}"
  # export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
  # export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
  export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
fi

## Node Version Manager
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Defer initialization of nvm until nvm, node or a node-dependent command is
# run. Ensure this block is only run once if .bashrc gets sourced multiple times
# by checking whether __init_nvm is a function.
if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(whence -w __init_nvm)" = function ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  declare -a __node_commands=('nvm' 'node' 'npm' 'npx' 'yarn' 'pnpm' 'pnpx' 'gulp' 'grunt' 'webpack')
  function __init_nvm() {
    for i in "${__node_commands[@]}"; do unalias $i; done
    \. "$NVM_DIR"/nvm.sh  # This loads nvm
    \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    unset __node_commands
    unset -f __init_nvm
  }
  for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi

if [[ -s "$HOME/.nvm/nvm.sh" ]]; then
  # === NPM BINARY CHINA ===
  # https://github.com/cnpm/binary-mirror-config/blob/master/package.json#L48
  export NODEJS_ORG_MIRROR="https://cdn.npmmirror.com/binaries/node"
  export NVM_NODEJS_ORG_MIRROR="https://cdn.npmmirror.com/binaries/node"
  export PHANTOMJS_CDNURL="https://cdn.npmmirror.com/binaries/phantomjs"
  export CHROMEDRIVER_CDNURL="https://cdn.npmmirror.com/binaries/chromedriver"
  export OPERADRIVER_CDNURL="https://cdn.npmmirror.com/binaries/operadriver"
  export ELECTRON_MIRROR="https://cdn.npmmirror.com/binaries/electron/"
  export ELECTRON_BUILDER_BINARIES_MIRROR="https://cdn.npmmirror.com/binaries/electron-builder-binaries/"
  export SASS_BINARY_SITE="https://cdn.npmmirror.com/binaries/node-sass"
  export SWC_BINARY_SITE="https://cdn.npmmirror.com/binaries/node-swc"
  export NWJS_URLBASE="https://cdn.npmmirror.com/binaries/nwjs/v"
  export PUPPETEER_DOWNLOAD_HOST="https://cdn.npmmirror.com/binaries"
  export SENTRYCLI_CDNURL="https://cdn.npmmirror.com/binaries/sentry-cli"
  export SAUCECTL_INSTALL_BINARY_MIRROR="https://cdn.npmmirror.com/binaries/saucectl"
  export npm_config_sharp_binary_host="https://cdn.npmmirror.com/binaries/sharp"
  export npm_config_sharp_libvips_binary_host="https://cdn.npmmirror.com/binaries/sharp-libvips"
  export npm_config_robotjs_binary_host="https://cdn.npmmirror.com/binaries/robotj"
fi

## Deno
if [[ -s "${HOME}/.deno/bin/deno" ]]; then
  export DENO_INSTALL="${HOME}/.deno"
  export PATH="${DENO_INSTALL}/bin:${PATH}"
fi

## Custom local bin for Haskell, Rust and etc
export PATH="${HOME}/.local/bin:${PATH}"

## Rust
# rustup path
if [[ -s "${HOME}/.cargo" ]]; then
  . "$HOME/.cargo/env"
fi
# rustup mirror from tuna, ustc-tug, sjtug
# export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
# export RUSTUP_UPDATE_ROOT=https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup
# export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
# export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
export RUSTUP_DIST_SERVER=https://mirror.sjtu.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirror.sjtu.edu.cn/rust-static/rustup

## sbt / scala
export SBT_OPTS="-Dsbt.override.build.repos=true ${SBT_OPTS}"
# export JVM_OPTS="-Dhttps.protocols=TLSv1.2,TLSv1.3 ${JVM_OPTS}"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

if [[ -n ${ZSH_PROF} ]]; then
  zprof
fi
