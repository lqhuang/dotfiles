

# select mirrors
sudo pacman-mirrors -i -c China -m rank

# update cache
sudo pacman -Syy

# update and upgrade
sudo pacman -Syu

# install packages

sudo pacman -S code vim tmux htop ps_mem


sudo pacman -S docker
# add current user to `docker` group


# dock application
sudo pacman -S plank


# Enable TRIM for SSD
sudo systemctl enable fstrim.timer


echo "tcp_bbr" | sudo tee /etc/modules-load.d/network-tune.conf > /dev/null



# aur
yay --aururl "https://aur.tuna.tsinghua.edu.cn" --save

# /etc/pacman.conf
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch

## Country : China
Server = https://mirrors.sjtug.sjtu.edu.cn/manjaro/stable/$repo/$arch

## Country : China
Server = https://mirrors.ustc.edu.cn/manjaro/stable/$repo/$arch

## Country : China
Server = https://mirrors.tuna.tsinghua.edu.cn/manjaro/stable/$repo/$arch


# Haskell
yay -S stack-static


