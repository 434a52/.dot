#!/bin/bash
set -euo pipefail

if [[ "$*" =~ "--install-tools" ]]; then
  "${HOME}"/.dotfiles/install/tools.sh
fi

if ! [[ -d "${HOME}/bin" ]]; then
  mkdir "${HOME}/bin"
fi

function link {
  source="${HOME}/.dotfiles/${1}"
  if [ "@#" -eq 1 ]; then
    target="${HOME}/${1}"
  else
    target="${HOME}/${2}"
  fi
  target_directory=$(dirname ${target})
  # echo "${source} >> ${target}"
  if [ -h "${target}" ]; then
    # echo "existing symlink"
    rm ${target}
  elif [ -f "${target}" ]; then
    # echo "existing file"
    if ! [ -f "${target}.bak" ]; then
      mv ${target} "${target}.bak"
    fi
  elif [ -d "${target}" ]; then
    # echo "existing directory"
    if ! [ -f "${target}.bak" ]; then
      mv ${target} "${target}.bak"
    fi
  fi
  mkdir -p "${target_directory}"
  ln -sfn "${source}" "${target}"
}

link .bashrc
link .bash_fns
link .bash_aliases

for file in bin/*.sh; do
  [ -e "${file}" ] || continue
  link "${file}"
done

# os specific profile
SYSTEM_OS=$(uname -a)
if [[ "${SYSTEM_OS}" == "Linux" ]]; then
  link "profile/linux" ".bash_os"
elif [[ "${SYSTEM_OS}" == "Darwin" ]]; then
  link "profile/macos" ".bash_os"
fi

if ! [[ -e "${HOME}/.bash_host" ]]; then
  {
    echo "#!/bin/bash"
    echo "set -euo pipefail"
    echo ""
    echo "export host_name=$(hostname -s)"
    echo "export ssh_port=22"
  } > "${HOME}/.bash_host"
fi

if ! [[ -e "${HOME}/.bash_user" ]]; then
  {
    echo "#!/bin/bash"
    echo "set -euo pipefail"
    echo ""
    echo "export user_name="
    echo "export user_email="
  } > "${HOME}/.bash_user"
fi

if ! [[ -e "${HOME}/.ssh/config" ]]; then
  touch "${HOME}/.ssh/config"
fi