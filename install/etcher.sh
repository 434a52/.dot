#!/bin/bash
set -e

if [ -z "$(which balena-etcher-electron)" ]; then

  echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list
  sudo apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 379CE192D401AB61

  sudo apt update
  sudo apt install -y balena-etcher-electron

fi
