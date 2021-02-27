#!/bin/bash

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

if [ -f /etc/bash_completion ]; then
  # shellcheck source=/dev/null
  source /etc/bash_completion
fi

export PS1="\[\e[0;35m\]\h \[\e[0;32m\]\w \[\e[0;37m\] \$(git_branch) > "
export PATH=${PATH}:${HOME}/bin

# shellcheck source=/dev/null
source "${HOME}/.bash_fns"
# shellcheck source=/dev/null
source "${HOME}/.bash_aliases"

if [ -e "${HOME}/.bash_user" ]; then
  # shellcheck source=/dev/null
  source "${HOME}/.bash_user"
fi

if [ -e "${HOME}/.bash_os" ]; then
  # shellcheck source=/dev/null
  source "${HOME}/.bash_os"
fi
