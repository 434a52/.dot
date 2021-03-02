#!/bin/bash
set -e

if [ -z "$(which ufw)" ]; then

  sudo apt install -y ufw
  sudo ufw allow "${SSH_PORT}"
  sudo ufw allow http/tcp
  sudo ufw allow https
  sudo ufw enable
  #sudo ufw status

fi