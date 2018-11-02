#!/bin/bash

DISTRO=$(lsb_release -is)

sudo -v


# set password of root
sudo passwd root


# First Update all
sudo apt update
sudo apt dist-upgrade


# drivers
ubuntu-drivers devices
sudo ubuntu-drivers autoinstall


# Install tuna mirror source
# Debian
add_debian_tuna_sources () {
    sudo apt install apt-transport-https
    sudo cat > /etc/apt/sources.list.d/tuna-sources.list << EOL
# Debian
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ $(lsb_release -cs) main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ $(lsb_release -cs) main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ $(lsb_release -cs)-updates main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ $(lsb_release -cs)-updates main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ $(lsb_release -cs)-backports main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ $(lsb_release -cs)-backports main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian-security $(lsb_release -cs)/updates main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security $(lsb_release -cs)/updates main contrib non-free
EOL
}

# Ubuntu
add_ubuntu_tuna_sources () {
    sudo cat > ./tuna-sources.list << EOL
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $(lsb_release -cs) main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $(lsb_release -cs) main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $(lsb_release -cs)-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $(lsb_release -cs)-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $(lsb_release -cs)-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $(lsb_release -cs)-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $(lsb_release -cs)-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $(lsb_release -cs)-security main restricted universe multiverse
EOL
}

case $DISTRO in
    "Debian")
        add_debian_tuna_sources
        ;;
    "Ubuntu")
        add_ubuntu_tuna_sources
        ;;
    *)
        echo "Error: this script is not suitable for current Linux distribution."
        ;;
esac


# Runlevel graphical.target / multi-user.target
systemctl get-default
# systemctl set-default multi-user.target


# SSH server
sudo apt install openssh-server
sudo systemctl restart sshd.service


# utils
sudo apt install net-tools curl -y
sudo apt install htop tmux zsh git -y
sudo apt build-essential -y


# oh-my-zsh
sudo chsh -s $(which zsh)
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"


# miniconda3
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh > ~/Downloads/Miniconda3-latest-Linux-x86_64.sh
# add `-s` option?
mkdir ~/Software
bash ~/Downloads/Miniconda3-latest-Linux-x86_64.sh -b -p ~/Software/miniconda3
# conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
# conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
# conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/
# conda config --set show_channel_urls yes


# docker-ce
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce -y
sudo usermod -aG docker $USER
# you still need to log out and log in again to make this change work
# or
# su root  # switch to root user
# su ${USER}  # switch back again


# vscode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo rm /tmp/microsoft.gpg
# sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code


# sublime
# sublime https://www.sublimetext.com/docs/3/linux_repositories.html
# sublime-merge https://www.sublimemerge.com/docs/linux_repositories
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
# sudo apt install apt-transport-https
sudo apt-get update
sudo apt-get install sublime-text -y
# sudo apt-get install sublime-merge -y


# shadowsocks-libev
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:max-c-lv/shadowsocks-libev -y
sudo apt-get update
sudo apt install shadowsocks-libev -y


# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt-get install google-chrome-stable -y


# dev-tools
# sudo apt-get install clang-format


# repair Firefox download file name
sudo apt install nautilus-filename-repairer


# Install LaTex fundamental packages
sudo apt-get install -y texlive-latex-base


# Haskell Stack
curl -sSL https://get.haskellstack.org/ | sh

stack upgrade
stack setup
# stack install hlint


# rust
curl https://sh.rustup.rs -sSf | sh # -s -- -y
