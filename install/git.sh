#!/bin/bash
set -e

if [ -z "$(which git)" ]; then

  if [ "${OS_NAME}" == "UBUNTU" ]; then
    sudo apt install -y git
  fi

  user_name_default=${USER_NAME}
  read -rp "git user.name [${user_name_default}]: " git_user_name
  git_user_name="${git_user_name:-$user_name_default}"

  user_email_default=${USER_EMAIL}
  read -rp "git user.email [${user_email_default}]: " git_user_email
  git_user_email="${git_user_email:-$user_email_default}"

  git config --global user.name "${git_user_name}"
  git config --global user.email "${git_user_email}"
  git config --global color.ui auto
  git config --global init.defaultBranch main
  git config --global credential.helper cache
  # set the cache to 90 minutes
  git config --global credential.helper "cache --timeout=5400"
  #git config --list

fi
