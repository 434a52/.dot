#!/bin/bash

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

none='\[\e[0m\]'
red='\[\e[0;31m\]'
green='\[\e[0;32m\]'
orange='\[\e[0;33m\]'
blue='\[\e[0;34m\]'
purple='\[\e[0;35m\]'
cyan='\[\e[0;36m\]'
light_gray='\[\e[0;37m\]'
darkgray='\[\e[1;30m\]'
light_red='\[\e[1;31m\]'
light_green='\[\e[1;32m\]'
yellow='\[\e[1;33m\]'
light_blue='\[\e[1;34m\]'
light_purple='\[\e[1;35m\]'
light_cyan='\[\e[1;36m\]'
white='\[\e[1;37m\]'

if [ -f /etc/bash_completion ]; then
  # shellcheck source=/dev/null
  source /etc/bash_completion
fi

# shellcheck source=/dev/null
source "${HOME}/.bash_fns"
# shellcheck source=/dev/null
source "${HOME}/.bash_aliases"

export PS1="${purple}\h ${green}\w ${blue}\$(git_branch)${none}> "
export PATH=${PATH}:${HOME}/bin

if [ -e "${HOME}/.bash_user" ]; then
  # shellcheck source=/dev/null
  source "${HOME}/.bash_user"
fi

if [ -e "${HOME}/.bash_os" ]; then
  # shellcheck source=/dev/null
  source "${HOME}/.bash_os"
fi
