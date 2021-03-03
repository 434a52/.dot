#!/bin/bash
# shellcheck disable=1090

# args;
# --user_name
# --os_name
# --os_type

# TODO: ${HOME} won't work for new user account
#       use /home/${user_name}/ if provided

if ! [ -f "${HOME}/.dotrc" ]; then

  os_name_default="UBUNTU"
  read -rp "OS_NAME [${os_name_default}]: " os_name
  os_name="${os_name:-$os_name_default}"

  os_type_default="SERVER"
  read -rp "OS_TYPE [${os_type_default}]: " os_type
  os_type="${os_type:-$os_type_default}"  

  host_name_default=${HOST}
  read -rp "HOST_NAME [${host_name_default}]: " host_name
  host_name="${host_name:-$host_name_default}"

  user_name_default=${USER}
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
    echo "export DOT=\"${user_name}/.dot\""
    echo "export OS_NAME=\"${os_name}\""
    echo "export OS_TYPE=\"${os_type}\""
    echo "export HOST_NAME=\"${host_name}\""
    echo "export USER_NAME=\"${user_name}\""
    echo "export USER_EMAIL=\"${user_email}\""
    echo "export SSH_PORT=\"${ssh_port}\""
  } > "${HOME}"/.dotrc
  
fi

source "${HOME}"/.dotrc
