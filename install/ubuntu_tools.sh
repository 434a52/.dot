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

  gsettings set org.gnome.desktop.background picture-options 'none'
  gsettings set org.gnome.desktop.background primary-color '#000000'

  apt_install gnome-tweaks
  apt_install fonts-firacode

fi
