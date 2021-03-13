#!/bin/bash
# shellcheck disable=1090

declare -A args
args["os_name"]="UBUNTU"
args["os_type"]="SERVER"
for arg in "$@"; do
  args[${arg%=*}]=${arg##*=}
done

home=${HOME}
if [ -v args["user_name"] ]; then
  home=/home/${args["user_name"]}
else
  args["user_name"]=${USER}
fi

if ! [ -f "${home}/.dotrc" ]; then

  os_name_default=${args["os_name"]}
  read -rp "OS_NAME [${os_name_default}]: " os_name
  os_name="${os_name:-$os_name_default}"

  os_type_default=${args["os_type"]}
  read -rp "OS_TYPE [${os_type_default}]: " os_type
  os_type="${os_type:-$os_type_default}"

  host_name_default=${HOSTNAME}
  read -rp "HOST_NAME [${host_name_default}]: " host_name
  host_name="${host_name:-$host_name_default}"

  user_name_default=${args[user_name]}
  read -rp "USER_NAME [${user_name_default}]: " user_name
  user_name="${user_name:-$user_name_default}"

  user_email_default=""
  read -rp "USER_EMAIL [${user_email_default}]: " user_email
  user_email="${user_email:-$user_email_default}"

  ssh_port_default=22
  read -rp "SSH_PORT [${ssh_port_default}]: " ssh_port
  ssh_port="${ssh_port:-$ssh_port_default}"

  {
    echo "#!/bin/bash"
    echo ""
    echo "export DOT=\"${home}/.dot\""
    echo "export OS_NAME=\"${os_name}\""
    echo "export OS_TYPE=\"${os_type}\""
    echo "export HOST_NAME=\"${host_name}\""
    echo "export USER_NAME=\"${user_name}\""
    echo "export USER_EMAIL=\"${user_email}\""
    echo "export SSH_PORT=\"${ssh_port}\""
    echo ""
  } > "${home}"/.dotrc

fi
