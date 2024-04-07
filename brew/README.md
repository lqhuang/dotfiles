# Homebrew

## Brew Bundle

- [Homebrew/homebrew-bundle](https://github.com/Homebrew/homebrew-bundle): 📦
  Bundler for non-Ruby dependencies from Homebrew, Homebrew Cask and the Mac App
  Store.
- [brew docs: bundle subcommand](https://docs.brew.sh/Manpage#bundle-subcommand):
  Bundler for non-Ruby dependencies from Homebrew, Homebrew Cask, Mac App Store,
  Whalebrew and Visual Studio Code.

## Improve experiences for people who live in China

mirrors for official taps:

```
# Replace the default git remote with a mirror in China
brew tap --custom-remote --force-auto-update homebrew/cask-fonts https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-fonts.git
brew tap --custom-remote --force-auto-update homebrew/services https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-services.git

# Restore the default git remote
brew tap --custom-remote --force-auto-update homebrew/cask-fonts https://github.com/Homebrew/homebrew-cask-fonts
brew tap --custom-remote --force-auto-update homebrew/services https://github.com/Homebrew/homebrew-services
```

Refs

- [Homebrew / Linuxbrew 镜像使用帮助](https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/)
- [Homebrew Services 源使用帮助](https://mirrors.ustc.edu.cn/help/homebrew-services.git.html)
