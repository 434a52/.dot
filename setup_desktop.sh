#!/bin/bash
set -euo pipefail

read -rp "user.email: " user_email
read -rp "ssh port: " ssh_port

{
  echo "export OS=UBUNTU_DESKTOP"
  echo "export HOST_NAME=$(hostname -s)"
  echo "export USER_NAME=${USER}"
  echo "export USER_EMAIL=${user_email}"
  echo "export SSH_PORT=${ssh_port}"
} > "${HOME}/.bash_local"

{
  echo ""
  echo "#>"
  echo "Port ${ssh_port}"
  echo "PermitRootLogin no"
  echo "#>"
} >> /etc/ssh/sshd_config

./install/git.sh

git clone https://github.com/434a52/.dot.git "/home/${HOME}/.dot"

.dot/setup.sh --install-tools
