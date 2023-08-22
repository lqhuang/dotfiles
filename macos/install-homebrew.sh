#!/bin/bash
export HOMEBREW_INSTALL_FROM_API=1
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"

bash -c "$(curl -fsSL https://github.com/Homebrew/install/raw/master/install.sh)"

echo "Please add the following env variables manually..."
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'

# (Optional) Install extra fonts
brew tap --custom-remote --force-auto-update homebrew/cask-fonts https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-fonts.git
brew install font-meslo-lg-nerd-font font-noto-sans-cjk-sc font-noto-serif-cjk-sc
