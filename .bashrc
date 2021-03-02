#!/bin/bash
# shellcheck disable=SC2034,1091,1090

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
fi

export PATH=${PATH}:${HOME}/bin

source "${HOME}/.dotrc"
source "${DOT}/lib/functions"
source "${DOT}/lib/aliases"
source "${DOT}/lib/theme"
