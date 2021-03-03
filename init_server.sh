#!/bin/bash
# shellcheck disable=1090
# /etc/default/motd-news :: ENABLED=0
set -e

read -rp "USER_NAME: " USER_NAME

adduser "${USER_NAME}"
usermod -a -G sudo "${USER_NAME}"
sudo passwd "${USER_NAME}"

./dotrc.sh --user_name="${USER_NAME}" --os_name=UBUNTU --os_type=SERVER

timedatectl set-timezone 'UTC'

echo "${HOST_NAME}" > /etc/hostname

{
  echo ""
  echo "#>"
  echo "127.0.0.1 localhost"
  echo "127.0.0.1 ${HOST_NAME}"
  echo "#>"
} >> /etc/hosts

{
  echo ""
  echo "#>"
  echo "Port ${SSH_PORT}"
  echo "PermitRootLogin no"
  echo "#>"
} >> /etc/ssh/sshd_config

echo "*** Rebooting Machine ***"

reboot
