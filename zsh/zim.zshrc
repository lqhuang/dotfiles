# zmodload zsh/zprof
export ZDOTDIR="${HOME}/.zsh"

# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# https://zsh.sourceforge.io/Doc/Release/Options.html
setopt noflowcontrol
setopt correct
setopt ignore_eof
bindkey "\eq" push-line-or-edit

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
zstyle ':zim:zmodule' use 'degit'

# Apply Shell Integration Script for iTerm2
#zstyle :omz:plugins:iterm2 shell-integration yes

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# Disable path highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting/issues/573
# Check default styles here: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/highlighters/main/main-highlighter.zsh
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none

#
# zsh autocompletion
#
# https://zsh.sourceforge.io/Doc/Release/Completion-System.html
zstyle ':completion:*' rehash true          # automatically find new executables in path,
zstyle ':completion:*' accept-exact '*(N)'  # Speed up completions in some cases
zstyle ':completion:*' use-cache on
zstyle ':completion::complete:*' cache-path "${ZDOTDIR}/.zcompcache"

#
# pure
#
# https://www.unicode.org/charts/nameslist/n_2190.html
# https://util.unicode.org/UnicodeJsps/character.jsp?a=00BB
PURE_PROMPT_SYMBOL="»"
PURE_PROMPT_VICMD_SYMBOL="«"

# #
# # marlonrichert/zsh-autocomplete
# #
# zstyle ':autocomplete:*' delay 0.2

#
# extra zsh completions
#
#fpath+=~/.zfunc

#
# Configuring `brew` completions in zsh
#
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
#
# To make Homebrew’s completions available in zsh, the Homebrew-managed `zsh/site-functions` path
# needs to be inserted into `FPATH` before initialising zsh’s completion facility.
if [[ -d "/opt/homebrew/share/zsh/site-functions" ]]; then
  fpath[1,0]="/opt/homebrew/share/zsh/site-functions"
fi

# ------------------
# Initialize modules
# ------------------

#ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
ZIM_HOME=${ZDOTDIR}/zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install

# #
# # marlonrichert/zsh-autocomplete
# #
# # reassign keys **after** loading autocomplete. (not working ???)
# bindkey              '^I'         menu-complete
# bindkey "$terminfo[kcbt]" reverse-menu-complete

# zprof
