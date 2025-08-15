# Common profile shared by both bash and zsh
# @lqhuang

######################## Options ############################################
# unset flowcontrol for tmux
[[ $- == *i* ]] && stty -ixon

# Q: What is `[[ $- == *i* ]]`?
# A: Fix "stty: 'standard input': Inappropriate ioctl for device"
#
# ref: https://stackoverflow.com/questions/24623021/getting-stty-standard-input-inappropriate-ioctl-for-device-when-using-scp-thro
#
# Why? Acutally, this would display from remote by some programs like `rsync` or else
# while they're using remote ssh session.

######################## Env Setup ############################################
KERNEL_NAME=$(uname -s)  # Linux / Darwin
#ARCH_NAME=$(uname -m)  # x86_64 / arm64
#SHELL_NAME="${SHELL##*/}"  # zsh / bash

# User configuration
## Standalone binary is awesome, that's good for me. (Haskell, Rust, Zig etc.)
if [[ -d "$HOME/.local" ]]; then
  export PATH="${HOME}/.local/bin:${PATH}"
  export MANPATH="${HOME}/.local/man:${MANPATH}"
fi

## Nix single user configuration if installed
if [ -e ${HOME}/.nix-profile/etc/profile.d/nix.sh ]; then . ${HOME}/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

## set locale config
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

## Check `~/.zshenv` for custom details.
## pre-defined `no_proxy``
export no_proxy=.local,.internal,.arpa,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16
export NO_PROXY=.local,.internal,.arpa,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16

## set visual and editor
export VISUAL=vim # nvim
export EDITOR=vim
# `VISUAL` 和 `EDITOR` ，会优先使用 `VISUAL` ，当无法使用时才会使用 `EDITOR`

######################## Common Aliases ############################################
# inspired from manjaro `.zshrc` configuration
# setopt correct                            # Auto correct mistakes

# alias cp='cp -i'                          # confirm before overwriting something
# alias df='df -h'                          # human-readable sizes
# alias du='du -h'                          # human-readable sizes
# alias free='free -m'                      # show sizes in MB
# alias ls='ls --color=auto'                # colored ls output
# alias diff="diff --color=auto"
# alias ip="ip -color=auto"
# alias bridge="bridge -color=auto"

# part of aliases inspired from: https://github.com/tiimgreen/github-cheat-sheet
alias gl='git log --pretty=tformat:"* %C(auto)%h%C(auto)%d %s%Creset %C(auto,blue)(%an)%Creset - %C(auto)%ad"'
alias glg='git log --all --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative'
alias gp='git pull --rebase'
alias gs='git status -b'
alias gss='git status -sb'
alias gbl='git branch --list -a -v'
alias grh='git reset --hard'
alias grs='git restore --staged'
alias grw='git restore --worktree'
alias gra='git restore --staged --worktree'
alias fgbc='git branch --all --no-color | fzf --select-1 | xargs git checkout'
alias fgbd="git branch --no-color | fzf --multi | xargs -I {} git branch -D '{}'"

alias npm='pnpm'
alias npx='pnpx'

if [[ KERNEL_NAME == 'Linux' ]]; then
  alias rsync='rsync -azh --partial --info=progress2'
else
  alias rsync='rsync -azh --partial'
fi

# activate python venv fastly
alias sap="source ./.venv/bin/activate"
alias sac="conda activate ./.conda-venv"

######################## Common Functions ############################################
# ## extract - archive extractor
# ## usage: extract <file>
# extract() {
#   if [[ -f $1 ]]; then
#     case $1 in
#       *.tar.bz2)   tar xjf $1    ;;
#       *.tar.gz)    tar xzf $1    ;;
#       *.tar.xz)    tar xJf $1    ;;
#       *.bz2)       bunzip2 $1    ;;
#       *.rar)       unrar x $1    ;;
#       *.gz)        gunzip $1     ;;
#       *.tar)       tar xf $1     ;;
#       *.tbz2)      tar xjf $1    ;;
#       *.tgz)       tar xzf $1    ;;
#       *.zip)       unzip $1      ;;
#       *.Z)         uncompress $1 ;;
#       *.7z)        7z x $1       ;;
#       *)           echo "'$1' cannot be extracted via exract()" ;;
#     esac
#   else
#     echo "'$1' is not a valid file"
#   fi
# }

# # check if stdout is a terminal
# if test -t 1; then
#   # see if it supports colors
#   ncolors=$(tput colors)

#   if test -n "${ncolors}"; then
#       bold="$(tput bold)"
#       normal="$(tput sgr0)"
#   fi
# fi

# function _set_env_porxy() {
#   echo -e "${bold}Setting proxy env variables...${normal}"

#   if [ ! -e "$no_proxy" ]; then
#     export no_proxy=".local,.internal,.arpa,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16"
#     export NO_PROXY=${no_proxy}
#   fi

#   echo -e "Get input proxy url: $1"
#   local proxy="$1"
#   export http_proxy="${proxy}"
#   export https_proxy="${proxy}"
#   export rsync_proxy="${proxy}"
#   export HTTP_PROXY="${proxy}"
#   export HTTPS_PROXY="${proxy}"
#   export RSYNC_PROXY="${proxy}"

#   _list_env_proxy
# }

# function _unset_env_proxy() {
#     unset http_proxy https_proxy rsync_proxy \
#           HTTP_PROXY HTTPS_PROXY RSYNC_PROXY
#     echo -e "${bold}Proxy environment variables removed.${normal}"

#     _list_env_proxy
# }

# function _list_env_proxy() {
#   # echo "List current Shell proxy environments"
#   # echo
#   echo "${bold}Shell proxy settings:${normal}"

#   for proxytype in "http" "https" "rsync" "no"; do
#     echo -e "${proxytype}_proxy=$(printenv ${proxytype}_proxy)"
#   done

#   for PROTOTYPE in "HTTP" "HTTPS"  "RSYNC" "NO"; do
#     echo -e "${PROTOTYPE}_PROXY=$(printenv ${PROTOTYPE}_PROXY)"
#   done
# }
