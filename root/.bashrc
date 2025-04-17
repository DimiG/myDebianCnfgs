################################################################################
# File        : .bashrc                                                        #
# Created by  : Created by (c)2025 DG                                          #
# Date        : 2025-04-17                                                     #
# Description : This is BASH configuration file is using by Debian VPS         #
################################################################################

# If NOT running interactively, DON'T DO ANYTHING...
# [[ $- != *i* ]] && return
case $- in
    *i*) ;;
      *) return;;
esac

# PROMPT SETUP
if [ "$EUID" -eq 0 ]; then
  # Prompt for ROOT
  PS1='\[\033[01;31m\][\u@\h]\[\033[00m\]:\[\033[01;34m\][\w]\[\033[00m\]\$ '
else
  # Prompt for USER
  PS1='\[\033[01;32m\][\u@\h]\[\033[00m\]:\[\033[01;34m\][\w]\[\033[00m\]\$ '
fi

export LS_OPTIONS='--color=auto'

###########
# Aliases #
###########

# Custom Aliases
alias rm='rm -vI'
alias cp='cp -vi'
alias mv='mv -vi'
alias md='mkdir -pv'
alias h='history -c'
alias q='exit'

alias l='ls $LS_OPTIONS -1'
alias la='ls $LS_OPTIONS -lhAF'
alias ll='ls $LS_OPTIONS -lhF'
alias lt='ls $LS_OPTIONS -lhtrF'
alias l.='ls $LS_OPTIONS -lhtrdF .*'
alias ls='ls $LS_OPTIONS'
alias dir='lt'
alias dot='l.'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

#############
# Functions #
#############

### NOTE(DG): No functions yet...

#############################
# SET USER DEFINED SETTINGS #
#############################

export EDITOR="vim"
unset HISTFILE

