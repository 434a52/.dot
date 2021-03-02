#!/bin/bash
set -e

if [ "${OS_NAME}" == "UBUNTU" ]; then
  sudo apt install -y curl
  sudo apt install -y wget
  sudo apt install -y htop
  sudo apt install -y nmap
  sudo apt install -y net-tools
  sudo apt install -y tmux
  sudo apt install -y micro
elif [ "${OS_NAME}" == "MAC" ]; then
  echo
  # cd ${HOME}/bin && curl https://getmic.ro | zsh
fi
