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
    # caskroom/cask/brew-cask
    # cmake
    # coreutils
    # findutils
    # wget
    zsh
)

caskapps=(
    # alfred
    # cheatsheet
    # google-chrome
    # intellij-idea-ce
    iterm2
    # java
    # pycharm-ce
    # vagrant
)

brew tap homebrew/versions
brew update
brew upgrade --all
brew install ${apps[@]}

brew tap caskroom/versions
brew cask update
brew cask install --appdir="/Applications" ${caskapps[@]}
brew cleanup
brew cask cleanup
