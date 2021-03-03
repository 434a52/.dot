#!/bin/bash
# shellcheck disable=SC2034,1091,1090

# /etc/default/motd-news :: ENABLED=0

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH=${PATH}:${HOME}/bin

source "${HOME}"/.dotrc
source "${DOT}"/lib/functions
source "${DOT}"/lib/aliases
source "${DOT}"/lib/theme
