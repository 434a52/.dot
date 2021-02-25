#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

sudo apt install -y fail2ban

{

  echo '[DEFAULT]'
  echo 'destemail = ${admin_email}'
  echo 'sendername = Fail2Ban'
  echo ''
  echo '[sshd]'
  echo 'enabled = true'
  echo 'port = ${ssh_port}'
  echo ''
  echo '[sshd-ddos]'
  echo 'enabled = true'
  echo 'port = ${ssh_port}'

} >> /etc/fail2ban/jail.local

sudo systemctl restart fail2ban
