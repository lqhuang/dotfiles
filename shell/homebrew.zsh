#
# Homebrew
#
# do what `eval "$(brew shellenv)"` does, but without calling `brew` command
#
KERNEL_NAME=$(uname -s)  # Linux / Darwin

__init_brew_bottles()  {
  # local host="https://mirrors.tuna.tsinghua.edu.cn"
  # local host="https://mirrors.ustc.edu.cn"
  local host="https://mirrors.cernet.edu.cn"

  # export HOMEBREW_INSTALL_FROM_API=1
  export HOMEBREW_API_DOMAIN="${host}/homebrew-bottles/api"
  export HOMEBREW_BOTTLE_DOMAIN="${host}/homebrew-bottles"
  # export HOMEBREW_BREW_GIT_REMOTE="${host}/git/homebrew/brew.git"
  # export HOMEBREW_CORE_GIT_REMOTE="${host}/git/homebrew/homebrew-core.git"
  export HOMEBREW_NO_ANALYTICS="1"
  export HOMEBREW_DOWNLOAD_CONCURRENCY="auto"
}

if [[ ${KERNEL_NAME} == "Darwin" ]]; then
  # The variables `HOMEBREW_PREFIX`, `HOMEBREW_CELLAR` and `HOMEBREW_REPOSITORY`
  # are also exported to avoid querying them multiple times.
  # HOMEBREW_PREFIX=$(brew --prefix)
  export HOMEBREW_PREFIX="/opt/homebrew"
  export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
  export HOMEBREW_REPOSITORY="/opt/homebrew"

  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"
  export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
  export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

  __init_brew_bottles
elif [[ ${KERNEL_NAME} == "Linux" && -d "/home/linuxbrew" ]]; then
  export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
  export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
  export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"

  export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}"
  export MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:"
  export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}"

  __init_brew_bottles
fi
