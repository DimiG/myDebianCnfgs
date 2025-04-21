################################################################################
# File        : .zshrc                                                         #
# Created by  : DG                                                             #
# Date        : 2025-04-25                                                     #
# Description : This ZSH configuration file is using by Debian VPS             #
################################################################################

# Load Colors
autoload -U colors && colors

# Set Variables
for color in red green yellow blue magenta cyan black white; do
  eval $color='%{$fg_no_bold[${color}]%}'
done

reset="%{$reset_color%}"

host="${yellow}%m"

# Start Init
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

# Load PromptInit
autoload -Uz promptinit && promptinit

# Load version control information (for Git)
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable if necessary
zstyle ':vcs_info:git:*' formats ' (git)->[%b'

# Define the theme
setopt PROMPT_SUBST

prompt_dgtheme_setup() {
  PROMPT='${green}[${host}${green}][${magenta}%~${green}${vcs_info_msg_0_}]${reset} '
}

# Add the theme to promptsys
prompt_themes+=( dgtheme )

# Load the theme
prompt dgtheme

# Command completion
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

# Set options
setopt auto_cd

# Autosuggestions and zsh-syntax-highlighting related
source $(dpkg -L zsh-autosuggestions | grep 'zsh$')
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------

# Some people use a different file for aliases
if [ -f "${HOME}/.zaliases" ]; then
  source "${HOME}/.zaliases"
fi

# ------------------------------------------------------------------------------
# Functions
# ------------------------------------------------------------------------------

# Some people use a different file for functions
if [ -f "${HOME}/.zfunctions" ]; then
  source "${HOME}/.zfunctions"
fi

# ------------------------------------------------------------------------------
# Custom Functions
# ------------------------------------------------------------------------------

# Some people use a different file for custom functions
if [ -f "${HOME}/.zcustom" ]; then
  source "${HOME}/.zcustom"
fi

# ------------------------------------------------------------------------------
# Key bindings
# ------------------------------------------------------------------------------

# Home, End and Delete Keys Enable
bindkey "^[[H"    beginning-of-line
bindkey "^[[F"    end-of-line
bindkey "^[[3~"   delete-char
bindkey "^[[5~"   up-line-or-history
bindkey "^[[6~"   down-line-or-history
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# ------------------------------------------------------------------------------
# History search
# ------------------------------------------------------------------------------
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# Configuring $PATH
typeset -U path PATH
path=(~/.local/bin $path)

# BAT
export BAT_PAGER="never"
export BAT_THEME="Visual Studio Dark+"

# Less
export LESSHISTFILE=-

# ------------------------------------------------------------------------------
# etc...
# ------------------------------------------------------------------------------

# Set comments in CLI
setopt INTERACTIVE_COMMENTS

# Disable BEEP
unsetopt beep

unset HISTFILE

