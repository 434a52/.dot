#!/bin/bash
#set -euo pipefail

read -rp "user.email: " user_email
read -rp "ssh port: " ssh_port

DOT="${HOME}"/.dot

{
  echo "#!/bin/bash"
  echo ""
  echo "export DOT=\"${DOT}\""  
  echo "export OS_NAME=\"UBUNTU\""
  echo "export OS_TYPE=\"DESKTOP\""
  echo "export HOST_NAME=\"$(hostname -s)\""
  echo "export USER_NAME=\"${USER}\""
  echo "export USER_EMAIL=\"${user_email}\""
  echo "export SSH_PORT=\"${ssh_port}\""
} > "${HOME}/.dotrc"

if ! [[ -d "${DOT}" ]]; then
  "${DOT}"/install/git.sh
  git clone https://github.com/434a52/.dot.git "${DOT}"
fi

"${DOT}"/setup.sh --install-tools
