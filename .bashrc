SYSTEM_OS=`uname -a`
SHORT_HOSTNAME=`hostname -s`

# run os specific profile
if [[ "${SYSTEM_OS}" == "Linux" ]]; then
  if [ -f "${HOME}/.dotfiles/profile.linux" ]; then
    source "${HOME}/.dotfiles/profile.linux"
  fi
elif [[ "${SYSTEM_OS}" == "Darwin" ]]; then
  if [ -f "${HOME}/.dotfiles/profile.darwin" ]; then
    source "${HOME}/.dotfiles/profile.darwin"
  fi
fi

# run host specific profile
if [ -f "${HOME}/.dotfiles/profile.${SHORT_HOSTNAME}" ]; then
  source "${HOME}/.dotfiles/profile.${SHORT_HOSTNAME}"
fi

alias ll="ls -vlAhg"

function reinit() {
  reset
  exec sudo --login --user "${USER}" /bin/sh -c "cd '${PWD}'; exec '${SHELL}' -l"
}

function apt_update() {
  sudo apt update
  sudo apt full-upgrade -y
  sudo apt autoremove -y

  if [ -f /var/run/reboot-required ] then
    cat /var/run/reboot-required
  else
    echo "System Updated"
  fi
}
