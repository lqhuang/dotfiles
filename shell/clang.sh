KERNEL_NAME=$(uname -s)  # Linux / Darwin
SHELL_NAME="${SHELL##*/}"  # zsh / bash

HOMEBREW_LLVM="${HOMEBREW_PREFIX}/opt/llvm"

if [[ -d ${HOMEBREW_LLVM} ]]; then
  export PATH="${HOMEBREW_LLVM}/bin:$PATH"
  export LDFLAGS="-L${HOMEBREW_LLVM}/lib/c++ -L${HOMEBREW_LLVM}/lib/unwind -lunwind"
fi


# To install symlinks for compilers that will automatically use
# ccache, prepend this directory to your PATH:
#   /opt/homebrew/opt/ccache/libexec

