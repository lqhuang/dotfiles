#!/bin/bash

REPODIR=$(dirname `realpath $0`)
KERNEL=$(uname -s)

link_dotfile () {
    local target=$1
    local dest=$2
    local backupdir=$(dirname $target)
    local fname=$(basename $dest)

    if [ -f $dest ]; then
        echo "$dest already existed. A backup has been saved in $backupdir"
        mv $dest $backupdir/$fname.bak
    fi
    echo "Generating softlink for $target ..."
    ln -s $target $dest

    return 0
}


# dotfiles in ~/home dir
dotfiles_home=(
    .condarc
    .gitconfig
    .zshrc
)

for dotfile in ${dotfiles_home[@]}; do
    link_dotfile $REPODIR/home/$dotfile $HOME/$dotfile
done


# VS Code
if [ $KERNEL == "Darwin" ]; then
    dest_settings=$HOME/Library/Application Support/Code/User/settings.json
elif [ $KERNEL == "Linux" ]; then
    dest_settings=$HOME/.config/Code/User/settings.json
else
    echo "This script is not suitable for current platform."
fi
link_dotfile $REPODIR/vscode/settings.json $dest_settings


# Sublime Text 3
if [ $KERNEL == "Darwin" ]; then
    dest_settings="$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
elif [ $KERNEL == "Linux" ]; then
    dest_settings=${HOME}/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
else
    echo "This script is not suitable for current platform."
fi
link_dotfile $REPODIR/sublime/Preferences.sublime-settings $dest_settings


# matplotrc
link_dotfile $REPODIR/matplotlib/matplotlibrc $HOME/.config/matplotlib/matplotlibrc
