#!/bin/bash
#set -e

function apt_install() {
  where=$(which "${1}")
  if [ -z "${where}" ]; then
    sudo apt install -y "${1}"
  fi
}

if [ "${OS_NAME}" = "UBUNTU" ]; then
  apt_install curl
  apt_install wget
  apt_install htop
  apt_install nmap
  apt_install tmux
  apt_install micro
  if [ "${OS_TYPE}" = "DESKTOP" ]; then
    apt_install fonts-firacode
  fi
elif [ "${OS_NAME}" = "MAC" ]; then
  where=$(which brew)
  if [ -z "$where" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  if ! [ -e "${HOME}/bin/micro" ]; then
    ( cd "${HOME}"/bin && curl https://getmic.ro | zsh )
  fi
  if ! [ -d "${DOT}/res/firacode" ]; then
    curl -o "${DOT}/res/firacode" https://github.com/tonsky/FiraCode/tree/master/distr/ttf
  fi
fi
