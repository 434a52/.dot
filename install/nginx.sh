#!/bin/bash
set -e

if [ -z "$(which nginx)" ]; then

  sudo apt install -y nginx

fi
