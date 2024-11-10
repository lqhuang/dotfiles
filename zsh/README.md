# ZSH

## Resources

- [zimfw/zimfw](https://github.com/zimfw/zimfw): Zim: Modular, customizable, and
  blazing fast Zsh framework <https://zimfw.sh>
- [romkatv/zsh4humans](https://github.com/romkatv/zsh4humans): A turnkey configuration for Zsh
- [romkatv/zsh-defer](https://github.com/romkatv/zsh-defer): Deferred execution of Zsh commands
- [mroth/evalcache](https://github.com/mroth/evalcache): 🐣 zsh plugin to cache eval loads to improve shell startup time
- [marlonrichert/zsh-autocomplete](https://github.com/marlonrichert/zsh-autocomplete):
  🤖 Real-time type-ahead completion for Zsh. Asynchronous find-as-you-type
  autocompletion.
- [le0me55i/zsh-extract](https://github.com/le0me55i/zsh-extract): Plugin for Zshell that extracts the archive file you pass it

## Profiling

- [Profiling zsh startup time](https://stevenvanbael.com/profiling-zsh-startup)
- [Speeding Up My Shell (Oh My Zsh)](https://blog.mattclemente.com/2020/06/26/oh-my-zsh-slow-to-load/#it's-probably-nvm): Always trying to be better
- 🌟 [Speeding Up Zsh](https://www.joshyin.cc/blog/speeding-up-zsh): This post documents the steps I took to speed up my Zsh startup times by more than 95%. I hope that anyone else struggling with sluggish startup times will find these optimizations helpful.
  - [Comparison of ZSH frameworks and plugin managers](https://gist.github.com/laggardkernel/4a4c4986ccdcaf47b91e8227f9868ded): Comparison of ZSH frameworks and plugin managers. GitHub Gist: instantly share code, notes, and snippets.

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

- [Commands](https://zimfw.sh/docs/commands/)

## References

- [如何使用 shell（3/3）—— 配置 zsh](https://a-wing.top/shell/2021/05/10/zsh-config)
- [Faster and enjoyable ZSH (maybe)](https://htr3n.github.io/2018/07/faster-zsh/)
- [@laixintao's snippet to load pyenv lazily](https://github.com/laixintao/myrc/blob/8d85f27a2f20504d3095cd017895c69bf5575440/.zshrc#L77)
- [Moving Away From Oh-My-Zsh](https://ianyepan.github.io/posts/moving-away-from-ohmyzsh/)
- [vincentbernat/zshrc](https://github.com/vincentbernat/zshrc): My .zshrc
- [A Guide to the Zsh Completion with Examples](https://thevaluable.dev/zsh-completion-guide-examples/)
- [Setting up zim with zsh](https://jade.fyi/blog/zsh-zim-setup/)
- [sindresorhus/pure](https://github.com/sindresorhus/pure): Pretty, minimal and fast ZSH prompt

## Lazy Loading

- [goarano/zsh-lazy-load](https://github.com/goarano/zsh-lazy-load): zsh/bash plugin for lazy loading completions
- [qoomon/zsh-lazyload](https://github.com/qoomon/zsh-lazyload): zsh plugin for lazy load commands and speed up start up time of zsh
- [rsteube/lazycomplete](https://github.com/rsteube/lazycomplete): lazy loading for shell completion scripts

### Lazy loading sdkman

- [sdkman/sdkman-cli/issues/977](https://github.com/sdkman/sdkman-cli/issues/977): Bug: Slow startup/init in ZSH
- [sdkman-lazy.zsh](https://gist.github.com/Amar1729/294c6e310b191405bf8fceb72e96b399)
- [qoomon/zsh-lazyload](https://github.com/qoomon/zsh-lazyload): zsh plugin for lazy load commands and speed up start up time of zsh
