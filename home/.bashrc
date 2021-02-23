SYS_OS=`uname -a` # linux or mac
SHORT_HOSTNAME=`hostname -s`

# system aliases
if [[ "$SYS_OS" == 'Linux' ]]; then
  #PATH="..LINUX PATH..."
  #source ~/dotfiles/aliases.lx
else
  #PATH="... MAC PATH..."
  #source ~/dotfiles/aliases.mac
fi

# run host specific profile
if [[ -e ~/dotfiles/profile.$SHORT_HOSTNAME ]]; then
  source ~/dotfiles/profile.$SHORT_HOSTNAME
fi

function reinit() {
  reset
  exec sudo --login --user "$USER" /bin/sh -c "cd '$PWD'; exec '$SHELL' -l"
}

function apt_update() {
  sudo apt update
  sudo apt full-upgrade -y
  sudo apt autoremove -y

  if [ -f /var/run/reboot-required ] then
    cat /var/run/reboot-required
  else
  	echo "Update Complete"
  fi
}
