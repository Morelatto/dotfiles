#!/usr/bin/env bash
# ~/.bashrc - Bash interactive shell configuration

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Disable bell
set bell-style none
bind 'set bell-style none'

# Basic prompt
PS1='[\u@\h \W]\$ '

# History settings
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend

# Better directory navigation
shopt -s autocd
shopt -s cdspell
shopt -s dirspell

# Essential aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'

# Safety aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Load system bashrc if it exists
[[ -f /etc/bash.bashrc ]] && source /etc/bash.bashrc

# Load bash completion if available
[[ -f /usr/share/bash-completion/bash_completion ]] && source /usr/share/bash-completion/bash_completion
