#!/bin/bash

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

export PS1="\[\e[0;35m\]\h \[\e[0;32m\]\w \[\e[0;37m\]> "

source ~/.bash_fns
source ~/.bash_aliases

if [ -e "${HOME}/.bash_user" ]; then
  source "${HOME}/.bash_user"
fi

if [ -e "${HOME}/.bash_os" ]; then
  source "${HOME}/.bash_os"
fi
