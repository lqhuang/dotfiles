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
add_debian_tuna_sources() {
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
add_ubuntu_tuna_sources() {
    sudo cat > /etc/apt/sources.list.d/tuna-sources.list << EOL
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
# sudo apt install openssh-server
# sudo systemctl restart sshd.service


# utils
sudo apt install net-tools curl -y
sudo apt install htop tmux zsh git -y
sudo apt install build-essential -y


# oh-my-zsh
# index: https://ohmyz.sh/
sudo chsh -s $(which zsh) ${USER}
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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
DISTRO_LOWER=$(echo ${DISTRO} | tr '[:upper:]' '[:lower:]')
# DISTRO_LOWER=${DISTRO,,}  # Non Posix: BASH 4.0 to lowercase. Not work under zsh
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/${DISTRO_LOWER}/gpg | sudo apt-key add -
# sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/${DISTRO_LOWER} $(lsb_release -cs) stable"
echo "deb [arch=amd64] https://download.docker.com/linux/${DISTRO_LOWER} $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get install docker-ce -y
sudo usermod -aG docker ${USER}
# you still need to log out and log in again to make this change work
# or
# su root  # switch to root user
# su ${USER}  # switch back again

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# docker-compose
# check https://github.com/docker/compose/releases for latest compose release
sudo curl -L https://github.com/docker/compose/releases/download/1.25.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


# vscode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/microsoft.gpg
sudo install -o root -g root -m 644 /tmp/microsoft.gpg /etc/apt/trusted.gpg.d/
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


# repair Firefox download file name
sudo apt install nautilus-filename-repairer


# Install LaTex fundamental packages
sudo apt-get install -y texlive-latex-base
# xelatex
sudo apt-get install -y texlive-xetex


# Haskell Stack
curl -sSL https://get.haskellstack.org/ | sh

stack upgrade --binary-only
# stack setup
# stack install hlint


# rustup
# curl https://sh.rustup.rs -sSf | sh # -s -- -y
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


# SDKMAN
curl -s "https://get.sdkman.io" | bash


# nvm - node / npm
# index: https://github.com/nvm-sh/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash

# if you work in China.
npm config set registry https://registry.npm.taobao.org/
# npm config set registry https://r.cnpmjs.org/

# Linuxbrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"


# install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

echo "source <(kubectl completion bash)" >> ~/.bashrc
# or
# plugins=(git zsh-completions kubectl)
# for Oh-My-Zsh
