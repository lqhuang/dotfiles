# ZSH

## Resources

- [Laurence Tratt: Faster Shell Startup With Shell Switching](https://tratt.net/laurie/blog/2024/faster_shell_startup_with_shell_switching.html)
- [zimfw/zimfw](https://github.com/zimfw/zimfw): Zim: Modular, customizable, and
  blazing fast Zsh framework <https://zimfw.sh>
- [romkatv/zsh4humans](https://github.com/romkatv/zsh4humans): A turnkey configuration for Zsh
- [romkatv/zsh-defer](https://github.com/romkatv/zsh-defer): Deferred execution of Zsh commands
- [mroth/evalcache](https://github.com/mroth/evalcache): 🐣 zsh plugin to cache eval loads to improve shell startup time
- [marlonrichert/zsh-autocomplete](https://github.com/marlonrichert/zsh-autocomplete): 🤖 Real-time type-ahead completion for Zsh. Asynchronous find-as-you-type autocompletion.
- [le0me55i/zsh-extract](https://github.com/le0me55i/zsh-extract): Plugin for Zshell that extracts the archive file you pass it
- https://github.com/so-fancy/diff-so-fancy/blob/next/pro-tips.md

## Profiling

- [Faster and enjoyable ZSH (maybe)](https://htr3n.github.io/2018/07/faster-zsh/)
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

Sequence of zmodules is critically important. 🥹

### Completion is not working under Ubuntu

If you use Ubuntu and installed Zsh with apt, then add the following line to your `~/.zshenv` file:

```sh
skip_global_compinit=1
```

In case you're getting a "warning: completion was already initialized before completion module." message in the terminal, then append the following script to `~/.zshenv` and restart your terminal to check further:

```sh
autoload -Uz +X compinit
functions[compinit]=$'print -u2 \'compinit being called at \'${funcfiletrace[1]}
'${functions[compinit]}
```

- [Troubleshooting: Completion is not working](https://github.com/zimfw/zimfw/wiki/Troubleshooting#completion-is-not-working)

## References

- [如何使用 shell（3/3）—— 配置 zsh](https://a-wing.top/shell/2021/05/10/zsh-config)
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

## Trouble Shooting

for `marlonrichert/zsh-autocomplete`

- [I don't want this thing: expansion, How to hide?](https://github.com/marlonrichert/zsh-autocomplete/issues/759)
  - and then happens "named directory stack" expansion ...
  - [question regarding `~` named directory](https://github.com/marlonrichert/zsh-autocomplete/discussions/529)

Lazy loading sdkman

- [sdkman/sdkman-cli/issues/977](https://github.com/sdkman/sdkman-cli/issues/977): Bug: Slow startup/init in ZSH
- [sdkman-lazy.zsh](https://gist.github.com/Amar1729/294c6e310b191405bf8fceb72e96b399)
- [qoomon/zsh-lazyload](https://github.com/qoomon/zsh-lazyload): zsh plugin for lazy load commands and speed up start up time of zsh

> I think I cannot get used to autocompletion. I find it a bit annoying. First,
> these candidates that pop up under the current position on the screen and
> create the distraction. Next, the logic itself. I have, say, "keyboard.json"
> and "keymaps" directory in my current dir. I type "vim key<TAB>" and it
> automatically selects "keymaps" instead of forcing me to make a choice. And in
> order to complete with "keyboard.json" I need to press 3 more keys - DOWN,
> DOWN and Enter (or TAB again) to select the file.
>
> Without autocompletion plugin, it would key "vim key<TAB>" - and I would see
> two candidates. At this point, I would be forced to make my choice, and I
> would do it by adding one more letter that makes the difference ("b"), then
> TAB again - and I have my command.
>
> Even fzf-completion feels more natural, because there by typing "\*\*<TAB>" I
> actually express the desire to select the item(s) from the list.
>
> Even worse, I type "vim ~/.zs<TAB>" and I end up with "vim ~/.fzf.zsh". No
> idea why.
>
> I find that most of the time autocompletion plug-in forces the value that I am
> not interested in. Traditional autocompletion seems to work better for me.
> Maybe I am missing something about configuring autosuggestion plug-in.
>
> https://www.reddit.com/r/zsh/comments/v08lsx/zshautocomplete_vs_zshautosuggestions_vs_fig/
