#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

curl -fsSL https://deb.nodesource.com/setup_15.x | sudo -E bash -

sudo apt-get install -y nodejs