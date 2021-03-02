#!/bin/bash
set -e

if [ -z "$(which fail2ban)" ]; then

  sudo apt install -y fail2ban

  {
    echo "[DEFAULT]"
    echo "destemail = ${USER_EMAIL}"
    echo "sendername = Fail2Ban"
    echo ""
    echo "[sshd]"
    echo "enabled = true"
    echo "port = ${SSH_PORT}"
    echo ""
    echo "[sshd-ddos]"
    echo "enabled = true"
    echo "port = ${SSH_PORT}"
  } > /etc/fail2ban/jail.local

  sudo systemctl restart fail2ban

fi