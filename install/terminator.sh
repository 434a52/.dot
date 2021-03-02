#!/bin/bash

if [ -z "$(which terminator)" ]; then
  sudo add-apt-repository ppa:gnome-terminator
  sudo apt update
  sudo apt install -y terminator
fi
