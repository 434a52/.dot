#!/bin/bash
set -euo pipefail

{
  echo "export OS=MAC"
  echo "export HOST_NAME=$(hostname -s)"
  echo "export USER_NAME=${USER}"
  echo "export USER_EMAIL="
  echo "export SSH_PORT=22"
} > "${HOME}/.bash_local"

git clone https://github.com/434a52/.dot.git "/home/${HOME}/.dot"

.dot/setup.sh
