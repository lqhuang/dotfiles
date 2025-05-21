# Nix

## Install records

```console
Would you like to see a more detailed list of what I will do?
[y/n] y

I will:

 - make sure your computer doesn't already have Nix files
   (if it does, I will tell you how to clean them up.)
 - create local users (see the list above for the users I'll make)
 - create a local group (nixbld)
 - install Nix in /nix
 - create a configuration file in /etc/nix
 - set up the "default profile" by creating some Nix-related files in
   /root
 - back up /etc/bashrc to /etc/bashrc.backup-before-nix
 - update /etc/bashrc to include some Nix configuration
 - back up /etc/profile.d/nix.sh to /etc/profile.d/nix.sh.backup-before-nix
 - update /etc/profile.d/nix.sh to include some Nix configuration
 - back up /etc/zshrc to /etc/zshrc.backup-before-nix
 - update /etc/zshrc to include some Nix configuration
 - back up /etc/bash.bashrc to /etc/bash.bashrc.backup-before-nix
 - update /etc/bash.bashrc to include some Nix configuration
 - back up /etc/zsh/zshrc to /etc/zsh/zshrc.backup-before-nix
 - update /etc/zsh/zshrc to include some Nix configuration
 - load and start a service (at /etc/systemd/system/nix-daemon.service
   and /etc/systemd/system/nix-daemon.socket) for nix-daemon
```

## Resources

- [Nix Reference Manual - Common Environment Variables](https://nix.dev/manual/nix/2.24/command-ref/env-common)
- [Nix Reference Manual - nix.conf](https://nix.dev/manual/nix/2.24/command-ref/conf-file)
  1. The system-wide configuration file `sysconfdir/nix/nix.conf` (i.e. `/etc/nix/nix.conf` on most systems), or `$NIX_CONF_DIR/nix.conf` if `NIX_CONF_DIR` is set.
  - **Values loaded in this file are not forwarded to the Nix daemon. The client assumes that the daemon has already loaded them.**
  2. If `NIX_USER_CONF_FILES` is set, then each path separated by `:` will be loaded in reverse order. Otherwise, it will look for `$XDG_CONFIG_HOME/nix/nix.conf`, usually defaults to `$HOME/.config/nix/nix.conf`
  3. If `NIX_CONFIG` is set, its contents are treated as the contents of a configuration file.
- [Best practices — nix.dev documentation](https://nix.dev/guides/best-practices.html)
- [Nix Reference Manual - Experimental features](https://nix.dev/manual/nix/2.24/development/experimental-features)

## Inspirations

- [Using Nix for Everything](https://kyswtn.com/posts/nix-for-everything): How I configure everything using Nix everywhere
