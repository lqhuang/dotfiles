# ZSH

## Resources

- [zimfw/zimfw](https://github.com/zimfw/zimfw): Zim: Modular, customizable, and
  blazing fast Zsh framework <https://zimfw.sh>
- [romkatv/zsh4humans](https://github.com/romkatv/zsh4humans): A turnkey configuration for Zsh

## Oh-My-Zsh

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

## Zimfw

## Plugins

- [mroth/evalcache](https://github.com/mroth/evalcache): 🐣 zsh plugin to cache
  eval loads to improve shell startup time
- [marlonrichert/zsh-autocomplete](https://github.com/marlonrichert/zsh-autocomplete):
  🤖 Real-time type-ahead completion for Zsh. Asynchronous find-as-you-type
  autocompletion.
- [le0me55i/zsh-extract](https://github.com/le0me55i/zsh-extract): Plugin for Zshell that extracts the archive file you pass it

## References

- [如何使用 shell（3/3）—— 配置 zsh](https://a-wing.top/shell/2021/05/10/zsh-config)
- [Faster and enjoyable ZSH (maybe)](https://htr3n.github.io/2018/07/faster-zsh/)
- [@laixintao's snippet to load pyenv lazily](https://github.com/laixintao/myrc/blob/8d85f27a2f20504d3095cd017895c69bf5575440/.zshrc#L77)
- [Moving Away From Oh-My-Zsh](https://ianyepan.github.io/posts/moving-away-from-ohmyzsh/)
- [vincentbernat/zshrc](https://github.com/vincentbernat/zshrc): My .zshrc
- [A Guide to the Zsh Completion with Examples](https://thevaluable.dev/zsh-completion-guide-examples/)
- [Setting up zim with zsh](https://jade.fyi/blog/zsh-zim-setup/)

## Lazy Loading

- [goarano/zsh-lazy-load](https://github.com/goarano/zsh-lazy-load): zsh/bash plugin for lazy loading completions
- [qoomon/zsh-lazyload](https://github.com/qoomon/zsh-lazyload): zsh plugin for lazy load commands and speed up start up time of zsh
- [rsteube/lazycomplete](https://github.com/rsteube/lazycomplete): lazy loading for shell completion scripts
