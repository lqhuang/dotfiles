# ZSH

Alternative git mirror of `ohmyzsh` in China:
<https://mirrors.tuna.tsinghua.edu.cn/help/ohmyzsh.git>

How to set git url after installing:

```sh
git -C $ZSH remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/ohmyzsh.git
```

Or just install `oh-my-zsh` from mirror git repo.

```sh
REMOTE=https://mirrors.tuna.tsinghua.edu.cn/git/ohmyzsh.git sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Framework

- [zimfw/zimfw](https://github.com/zimfw/zimfw): Zim: Modular, customizable, and
  blazing fast Zsh framework <https://zimfw.sh>

## Plugins

- [mroth/evalcache](https://github.com/mroth/evalcache): 🐣 zsh plugin to cache
  eval loads to improve shell startup time
- [marlonrichert/zsh-autocomplete](https://github.com/marlonrichert/zsh-autocomplete):
  🤖 Real-time type-ahead completion for Zsh. Asynchronous find-as-you-type
  autocompletion.

## References

- [如何使用 shell（3/3）—— 配置 zsh](https://a-wing.top/shell/2021/05/10/zsh-config)
- [Faster and enjoyable ZSH (maybe)](https://htr3n.github.io/2018/07/faster-zsh/)
- [@laixintao's snippet to load pyenv lazily](https://github.com/laixintao/myrc/blob/8d85f27a2f20504d3095cd017895c69bf5575440/.zshrc#L77)
- [Moving Away From Oh-My-Zsh](https://ianyepan.github.io/posts/moving-away-from-ohmyzsh/)
