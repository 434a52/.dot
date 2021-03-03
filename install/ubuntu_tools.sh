#!/bin/bash

function apt_install() {
  where=$(which "${1}")
  if [ -z "${where}" ]; then
    sudo apt install -y "${1}"
  fi
}

apt_install curl
apt_install wget
apt_install htop
apt_install nmap
apt_install tmux
apt_install micro

if [ "${OS_TYPE}" = "DESKTOP" ]; then
  apt_install fonts-firacode
fi
