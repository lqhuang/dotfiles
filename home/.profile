# Common profile shared by both bash and zsh
# @lqhuang

######################## Env Setup ############################################
KERNEL_NAME=$(uname -s)  # Linux / Darwin
ARCH_NAME=$(uname -m)  # x86_64 / arm64

# User configuration
## Standalone binary is awesome, that's good for me. (Haskell, Rust, Zig etc.)
export PATH="${HOME}/.local/bin:${PATH}"
export MANPATH="${HOME}/.local/man:${MANPATH}"

## set locale config
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## pre-defined `no_proxy``
# export https_proxy=http://localhost:7890
export no_proxy=.local,.internal,.arpa,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16

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

######################## Common Aliases ############################################
# inspired from manjaro `.zshrc` configuration
# setopt correct                            # Auto correct mistakes

alias cp='cp -i'                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias du='du -h'                     # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias ls='ls --color=auto'                # colored ls output

######################## Common Functions ############################################
## extract - archive extractor
## usage: extract <file>
extract() {
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

# check if stdout is a terminal
if test -t 1; then
  # see if it supports colors
  ncolors=$(tput colors)

  if test -n "${ncolors}"; then
      bold="$(tput bold)"
      normal="$(tput sgr0)"
  fi
fi

function _set_env_porxy() {
  echo -e "${bold}Setting proxy env variables...${normal}"

  if [ ! -e "$no_proxy" ]; then
    export no_proxy=".local,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16"
    export NO_PROXY=${no_proxy}
  fi

    local proxy=$1
    export http_proxy=$proxy
    export https_proxy=$proxy
    export rsync_proxy=$proxy
    export HTTP_PROXY=$proxy
    export HTTPS_PROXY=$proxy
    export RSYNC_PROXY=$proxy

    _list_env_proxy
}

function _unset_env_proxy() {
    unset http_proxy https_proxy rsync_proxy \
          HTTP_PROXY HTTPS_PROXY RSYNC_PROXY
    echo -e "${bold}Proxy environment variables removed.${normal}"

    _list_env_proxy
}

function _list_env_proxy() {
  # echo "List current Shell proxy environments"
  # echo
  echo "${bold}Shell proxy settings:${normal}"

  for proxytype in "http" "https" "rsync" "no"; do
    local proxy_name=${proxytype}_proxy
    echo -e "${proxytype}_proxy=${!proxy_name}"
  done

  for PROTOTYPE in "HTTP" "HTTPS"  "RSYNC" "NO"; do
    echo -e "${PROTOTYPE}_PROXY=$(printenv ${PROTOTYPE}_PROXY)"
  done
}

########################## Software Init ######################################

## Homebrew
if [[ ${KERNEL_NAME} == "Darwin" ]]; then
  [[ ${ARCH_NAME} == "arm64" ]] && export PATH="${BREW_PREFIX}/bin:${BREW_PREFIX}/sbin:${PATH}"
  export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
  export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
  # export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
  # export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
fi

## fnm
if [[ ${KERNEL_NAME} == "Linux" ]]; then
  FNM_DIR="${HOME}/.local/share/fnm"
  if [[ -d "${FNM_DIR}" ]]; then
    export PATH="${FNM_DIR}:${PATH}"
  fi
fi

if [[ -s $(command -v fnm) ]]; then
  eval "$(fnm env)"

  # === NPM BINARY CHINA ===
  # https://github.com/cnpm/binary-mirror-config/blob/master/package.json#L48
  export NODEJS_ORG_MIRROR="https://cdn.npmmirror.com/binaries/node"
  export NVM_NODEJS_ORG_MIRROR="${NODEJS_ORG_MIRROR}"
  export FNM_NODE_DIST_MIRROR="${NODEJS_ORG_MIRROR}"
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

## Rust
# rustup path
if [[ -s "${HOME}/.cargo" ]]; then
  . "$HOME/.cargo/env"
  # rustup mirror from tuna, ustc-tug, sjtug
  export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
  export RUSTUP_UPDATE_ROOT=https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup
  # export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
  # export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
  # export RUSTUP_DIST_SERVER=https://mirror.sjtu.edu.cn/rust-static
  # export RUSTUP_UPDATE_ROOT=https://mirror.sjtu.edu.cn/rust-static/rustup
  export CARGO_HTTP_MULTIPLEXING=false
fi

## sbt / scala / sdkman
export SBT_OPTS="-Dsbt.override.build.repos=true ${SBT_OPTS}"
export JVM_OPTS="-Dhttps.protocols=TLSv1.2,TLSv1.3 ${JVM_OPTS}"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

## Python
# # pyenv
# if [[ ${KERNEL_NAME} == "Linux" ]] && [[ -s "${HOME}/.pyenv" ]]; then
#   export PYENV_ROOT="$HOME/.pyenv"
#   command -v pyenv > /dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#   eval "$(pyenv init -)"
#   # eval "$(pyenv virtualenv-init -)"
# fi

# pipx
if [[ ${KERNEL_NAME} == "Darwin" ]]; then
  # Created by `pipx` on 2023-04-09 17:38:27
  export PATH="$PATH:${HOME}/Library/Python/3.9/bin"
fi
