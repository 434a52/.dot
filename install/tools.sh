#!/bin/bash
#set -e

function apt_install() {
  where=$(which "${1}")
  if [ -z "${where}" ]; then
    sudo apt install -y "${1}"
  fi
}

if [ "${OS_NAME}" == "UBUNTU" ]; then
  apt_install curl
  apt_install wget
  apt_install htop
  apt_install nmap
  apt_install tmux
  apt_install micro
elif [ "${OS_NAME}" == "MAC" ]; then
  cd "${HOME}"/bin && curl https://getmic.ro | zsh
fi
