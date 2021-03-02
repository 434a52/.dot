#!/bin/bash
set -e

if [ -z "$(which nodejs)" ]; then

  curl -fsSL https://deb.nodesource.com/setup_15.x | sudo -E bash -
  sudo apt install -y nodejs

fi
