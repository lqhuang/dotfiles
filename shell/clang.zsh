KERNEL_NAME=$(uname -s)  # Linux / Darwin
SHELL_NAME="${SHELL##*/}"  # zsh / bash

HOMEBREW_LLVM="${HOMEBREW_PREFIX}/opt/llvm"
if [[ -d "${HOMEBREW_LLVM}" ]]; then
  export PATH="${HOMEBREW_LLVM}/bin:${PATH}"
  export LDFLAGS="-L${HOMEBREW_LLVM}/lib/c++ -L${HOMEBREW_LLVM}/lib/unwind -lunwind"
fi

# NOTE:
# To install symlinks for compilers that will automatically use
# ccache, prepend this directory to your PATH:
HOMEBREW_CCACHE="${HOMEBREW_PREFIX}/opt/ccache"
if [[ -d "${HOMEBREW_CCACHE}" ]]; then
  export PATH="${HOMEBREW_CCACHE}/libexec:${PATH}"
fi
