#!/usr/bin/env bash
# install XCode
xcode-select --install

# let Finder show status bar
# defaults write com.apple.finder ShowStatusBar -bool true

# let Finder show full path
# defaults write com.apple.finder ShowPathbar -bool true

# disable create .DS_Store file in network drivers
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# see https://github.com/paulmillr/dotfiles/blob/master/etc/macos.sh
# for more tweak config.

# Install Homebrew
# Validate root password.
sudo -v

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# packages to be installed
apps=(
  # cmake
  # coreutils
  # findutils
  # wget
  htop
  tmux
  iperf3
  tree
  zsh-autosuggestions
  zsh-history-substring-search
)

more_cli=(
  neovim
  ripgrep
  fd
  fnm
  fzf
  nnn
  zsh-syntax-highlighting
  bash-completion@2
  terraform
  git-cliff
)

caskapps=(
  # alfred
  # cheatsheet
  # google-chrome
  iterm2
  sublime-text
  raycast
  iina
  font-noto-sans-cjk-sc
  firefox
)

more_caskapps=(
  zotero
  cyberduck
  figma
  warp
  stats
  slack
  postman
  alt-tab
  vnc-viewer
  readdle-spark
  the-unarchiver
)

brew doctor

brew tap homebrew/versions
brew update
brew upgrade --all
brew install ${apps[@]}

brew tap caskroom/versions
brew tap caskroom/cask
brew tap cashroom/fonts
brew cask update
brew cask install --appdir="/Applications" ${caskapps[@]}
brew cleanup
brew cask cleanup
