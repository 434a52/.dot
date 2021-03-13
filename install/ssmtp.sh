#!/bin/bash
set -e

if [ -z "$(which ssmtp)" ]; then
  sudo apt install -y ssmtp
fi

if ! [[ -f /etc/ssmtp/ssmtp.conf.bak ]]; then
  sudo mv -v /etc/ssmtp/ssmtp.conf /etc/ssmtp/ssmtp.conf.bak
fi

read -rp "Mail Host [smtp.fastmail.com:465] " mail_host
read -rp "Mail User [user@434a52.io] " mail_user
read -rp "Mail Pass [secret] " mail_pass

{
  echo "root=${USER_EMAIL}"
  echo "mailhub=${mail_host}"
  echo "AuthUser=${mail_user}"
  echo "AuthPass=${mail_pass}"
  echo "UseTLS=YES"
  echo "UseSTARTTLS=YES"
  echo "rewriteDomain=434a52.io"
  echo "hostname=${USER_EMAIL}"
  echo "FromLineOverride=NO"
  echo ""
} > /etc/ssmtp/ssmtp.conf
