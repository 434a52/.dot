#!/bin/bash
set -euo pipefail

{
  echo "export OS_NAME=MAC"
  echo "export OS_TYPE=DESKTOP"
  echo "export HOST_NAME=$(hostname -s)"
  echo "export USER_NAME=${USER}"
  echo "export USER_EMAIL="
  echo "export SSH_PORT=22"
} > "${HOME}/.dot.conf"

git clone https://github.com/434a52/.dot.git "/home/${HOME}/.dot"

.dot/setup.sh
