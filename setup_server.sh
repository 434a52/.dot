#!/bin/bash
set -euo pipefail

timedatectl set-timezone 'UTC'

read -rp "hostname: " host_name
read -rp "user.name: " user_name
read -rp "user.email: " user_email
read -rp "ssh port: " ssh_port
read -rp "Press Y to proceed" proceed

if [ "${proceed}" == "Y" ]; then

  echo "${host_name}" > /etc/hostname

  {
    echo ""
    echo "#>"
    echo "127.0.0.1 localhost"
    echo "127.0.0.1 ${host_name}"
    echo "#>"
  } >> /etc/hosts

  adduser "${user_name}"
  usermod -a -G sudo "${user_name}"
  sudo passwd "${user_name}"

  {
    echo ""
    echo "#>"
    echo "Port ${ssh_port}"
    echo "PermitRootLogin no"
    echo "#>"
  } >> /etc/ssh/sshd_config

  {
    echo "export USER_NAME=${user_name}"
    echo "export USER_EMAIL=${user_email}"
  } > "/home/${user_name}/.bash_user"

  {
    echo "export HOST_NAME=${host_name}"
    echo "export SSH_PORT=${ssh_port}"
  } > "/home/${user_name}/.bash_host"

  echo "*** Rebooting Machine ***"

  sudo reboot

fi
