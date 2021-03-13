#!/bin/bash
set -e

if [ -z "$(which ssmtp)" ]; then
  sudo apt install -y ssmtp
fi

if ! sudo [ -f /etc/ssmtp/ssmtp.conf.bak ]; then
  sudo mv -v /etc/ssmtp/ssmtp.conf /etc/ssmtp/ssmtp.conf.bak
fi

echo "MAIL_HOST: "${MAIL_HOST}

mail_host_default=${MAIL_HOST}
read -rp "Mail Host [${mail_host_default}]: " mail_host
mail_host="${mail_host:-mail_host_default}"

mail_user_default=${MAIL_USER}
read -rp "Mail Host [${mail_user_default}]: " mail_user
mail_user="${mail_user:-mail_user_default}"

mail_pass_default=${MAIL_PASS}
read -rp "Mail Host [${mail_pass_default}]: " mail_pass
mail_pass="${mail_pass:-mail_pass_default}"

sudo tee <<EOF /etc/ssmtp/ssmtp.conf >/dev/null
  root=${USER_EMAIL}
  mailhub=${mail_host}
  AuthUser=${mail_user}
  AuthPass=${mail_pass}
  UseTLS=YES
  UseSTARTTLS=YES
  rewriteDomain=434a52.io
  hostname=${USER_EMAIL}
  FromLineOverride=NO
EOF

{
  echo "From: ${USER_EMAIL}"
  echo "To: ${USER_EMAIL}"
  echo "Subject: Test Email"
  echo ""
  echo "This is a test email from ${USER_NAME}@${HOST_NAME}"
} > "${HOME}/mail.txt"

