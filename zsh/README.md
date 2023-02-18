# ZSH

Alternative git mirror of `ohmyzsh` in China

    https://mirrors.tuna.tsinghua.edu.cn/help/ohmyzsh.git/

How to set git url after installing:

    git -C $ZSH remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/ohmyzsh.git

Or just install `oh-my-zsh` from mirror git repo.

    REMOTE=https://mirrors.tuna.tsinghua.edu.cn/git/ohmyzsh.git sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Plugins

- [mroth/evalcache](https://github.com/mroth/evalcache): 🐣 zsh plugin to cache
  eval loads to improve shell startup time
