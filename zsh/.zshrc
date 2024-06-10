# if [[ -n ${ZSH_PROF} ]]; then
#   zmodload zsh/zprof
# fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
  # ZSH_THEME="robbyrussell"
  # Do not set ZSH_THEME when using Wrap Terminal
  if [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]; then
    # ZSH_THEME="fishy"
    ZSH_THEME="ys"
  else
    ZSH_THEME="af-magic"
  fi
fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  # colored-man-pages
  # common-aliases
)

## Customize plugins before Oh My Zsh is sourced

## Load and initialize Oh My Zsh
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

######################## Env Setup ############################################
KERNEL_NAME=$(uname -s)  # Linux / Darwin
ARCH_NAME=$(uname -m)  # x86_64 / arm64

## Homebrew
if [[ ${KERNEL_NAME} == "Darwin" ]]; then
  # BREW_PREFIX=$(brew --prefix)
  export HOMEBREW_PREFIX="/opt/homebrew"
  export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
  export HOMEBREW_REPOSITORY="/opt/homebrew"
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"
  export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
  export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

  # export HOMEBREW_INSTALL_FROM_API=1
  export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
  export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
  # export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
  # export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
elif [[ ${KERNEL_NAME} == "Linux" && -d "/home/linuxbrew" ]]; then
  # echo $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
  export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar";
  export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew";
  export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}";
  export MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:";
  export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}";

  export HOMEBREW_INSTALL_FROM_API=1
  export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
  export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
  export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
  export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
fi

######################## ZSH Opts ##############################################
# https://zsh.sourceforge.io/Doc/Release/Options.html
setopt correct
bindkey "\eq" push-line-or-edit

######################## ZSH Plugins ##############################################

# ## auto completion (obviously not required under oh-my-zsh)
# ## https://zsh.sourceforge.io/Doc/Release/Completion-System.html
# autoload -Uz compinit && compinit
# zstyle ':completion:*' menu select
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path
# ## Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
# zstyle ':completion:*' use-cache on
# zstyle ':completion:*' cache-path ${ZSH}/cache

## Plugins section: Enable fish style features
### Use syntax highlighting: zsh-syntax-highlighting.zsh
### Use history substring search: zsh-history-substring-search.zsh
### Use autosuggestion: zsh-autosuggestions.zsh
if [[ ${KERNEL_NAME} == "Linux" ]]; then
  if [[ -s /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  fi
elif [[ ${KERNEL_NAME} == "Darwin" ]]; then
  if [[ -s ${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source ${HOMEBREW_PREFIX}/share/zsh-history-substring-search/zsh-history-substring-search.zsh
    source ${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source ${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  fi
fi

# https://github.com/zsh-users/zsh-syntax-highlighting/issues/573
# Check default styles here: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/highlighters/main/main-highlighter.zsh
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none

# # terraform
# TERRAFORM=$(command -v terraform)
# if [[ -x "${TERRAFORM}" ]]; then
#   # oh-my-zsh has loaded `bashcompinit` already
#   # autoload -U +X bashcompinit && bashcompinit
#   complete -o nospace -C ${TERRAFORM} terraform
# fi

########################## ZSH Alias ##########################################
alias git="noglob git"
alias rg="noglob rg"
alias grep="noglob grep"

########################## Software Init ######################################
## fzf
if [[ -x $(command -v fzf) ]]; then
  if [[ ${KERNEL_NAME} == "Linux" ]]; then
    DISTRO=$(lsb_release -is)
    if [[ ${DISTRO} == "Debian" ]]; then
      source /usr/share/doc/fzf/examples/completion.zsh
      # source /usr/share/doc/fzf/examples/key-bindings.zsh
    else
      source /usr/share/fzf/completion.zsh
      # source /usr/share/fzf/key-bindings.zsh
    fi
  elif [[ ${KERNEL_NAME} == "Darwin" ]]; then
    source ${HOMEBREW_PREFIX}/opt/fzf/shell/completion.zsh
    # source ${HOMEBREW_PREFIX}/opt/fzf/shell/key-bindings.zsh
  fi
fi

# Set the `auto_activate_base` parameter to `false` after installation,
# which makes base environment not be activated on startup.
# > conda config --set auto_activate_base false

######################## Source Common ############################################
[[ -s "${HOME}/Git/dotfiles/home/.shared_profile" ]] && source ${HOME}/Git/dotfiles/home/.shared_profile

# if [[ -n ${ZSH_PROF} ]]; then
#   zprof
# fi
