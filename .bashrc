#!/bin/bash

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

if [ -f "${HOME}/.secrets" ]; then
  source "${HOME}/.secrets"
fi

# os specific profile
SYSTEM_OS=`uname -a`
if [[ "${SYSTEM_OS}" == "Linux" ]]; then
  if [ -f "${HOME}/.profile.linux" ]; then
    source "${HOME}/.profile.linux"
  fi
elif [[ "${SYSTEM_OS}" == "Darwin" ]]; then
  if [ -f "${HOME}/.profile.darwin" ]; then
    source "${HOME}/.profile.darwin"
  fi
fi

source ~/.bash_exports
source ~/.bash_fns
source ~/.bash_aliases

# host specific profile
SHORT_HOSTNAME=`hostname -s`
if [ -f "${HOME}/.profile.${SHORT_HOSTNAME}" ]; then
  source "${HOME}/.profile.${SHORT_HOSTNAME}"
fi
