#!/bin/bash

sudo apt update && sudo apt full-upgrade -y

function install {
  which $2 &> /dev/null

  if [ $? -ne 0 ]; then
    # echo "Installing: ${2}"
    if [ $1 = "apt" ]; then
      sudo apt install -y $2
    elif [ $1 = "snap" ]; then
      sudo snap install $2
    fi
  fi
}

install apt  curl
install apt  wget
install apt  git
install apt  htop
install apt  nmap
install apt  net-tools
install snap tree
install apt  micro

sudo apt upgrade -y
sudo apt autoremove -y
