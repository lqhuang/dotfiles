#
# Rust
#

# rustup path
if [[ -s "${HOME}/.cargo" ]]; then
  . "$HOME/.cargo/env"
  # rustup mirror from tuna, ustc-tug, sjtug
  # export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
  # export RUSTUP_UPDATE_ROOT=https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup
  # export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
  # export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
  export RUSTUP_DIST_SERVER=https://mirror.sjtu.edu.cn/rust-static
  export RUSTUP_UPDATE_ROOT=https://mirror.sjtu.edu.cn/rust-static/rustup
  #export CARGO_HTTP_MULTIPLEXING=false
fi
