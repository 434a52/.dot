#!/bin/bash
# shellcheck disable=SC2034,1091,1090

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export BASH_SILENCE_DEPRICATION_WARNING=1
export PATH=${PATH}:${HOME}/bin

source "${HOME}"/.dotrc
source "${DOT}"/lib/functions
source "${DOT}"/lib/aliases
source "${DOT}"/lib/theme
