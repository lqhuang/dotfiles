KERNEL_NAME=$(uname -s)  # Linux / Darwin
SHELL_NAME="${SHELL##*/}"  # zsh / bash

#
# Javascript / Typescript
#

# fnm
if [[ ${KERNEL_NAME} == "Linux" ]]; then
  FNM_DIR="${HOME}/.local/share/fnm"
  if [[ -d "${FNM_DIR}" ]]; then
    export PATH="${FNM_DIR}:${PATH}"
  fi
fi
if [[ -s $(command -v fnm) ]]; then
  eval "$(fnm env)"
  # completions are registered by brew already
  #source <(fnm completions --shell ${SHELL_NAME})
fi

if [[ -s $(command -v fnm) || -s $(command -v pnpm) ]]; then
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

# Deno
if [[ -s "${HOME}/.deno/bin/deno" ]]; then
  export DENO_INSTALL="${HOME}/.deno"
  export PATH="${DENO_INSTALL}/bin:${PATH}"
fi
