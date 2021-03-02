#!/bin/bash
set -euo pipefail

read -rp "hostname: " host_name
read -rp "user.name: " user_name
read -rp "user.email: " user_email
read -rp "ssh port: " ssh_port
read -rp "Press Y to proceed" proceed

if [ "${proceed}" == "Y" ]; then

  timedatectl set-timezone 'UTC'

  sudo apt install -y git

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

  export DOT="/home/${user_name}/.dot"

  {
    echo "#!/bin/bash"
    echo "set -e"
    echo ""
    echo "export DOT=${DOT}"
    echo "export OS_NAME=UBUNTU"
    echo "export OS_TYPE=SERVER"
    echo "export HOST_NAME=${host_name}"
    echo "export USER_NAME=${user_name}"
    echo "export USER_EMAIL=${user_email}"
    echo "export SSH_PORT=${ssh_port}"
  } > "/home/${user_name}/.dotrc"

  git clone https://github.com/434a52/.dot.git "${DOT}"

  /bin/su -c "${DOT}/setup.sh --install-tools" - "${user_name}"

  echo "*** Rebooting Machine ***"

  sudo reboot

fi
