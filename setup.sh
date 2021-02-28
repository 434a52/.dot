#!/bin/bash
# shellcheck disable=1090
set -euo pipefail

if [[ "$*" =~ "--install-tools" ]]; then
  "${HOME}"/.dot/install/tools.sh
fi

if ! [[ -d "${HOME}/bin" ]]; then
  mkdir "${HOME}/bin"
fi

if ! [[ -d "${HOME}/code" ]]; then
  mkdir "${HOME}/code"
fi

if ! [[ -e "${HOME}/code/repo-list" ]]; then
  touch "${HOME}/code/repo-list"
fi

function link {
  source="${HOME}/.dot/${1}"
  if [[ $# -eq 1 ]]; then
    target="${HOME}/${1}"
  else
    target="${HOME}/${2}"
  fi
  target_directory=$(dirname "${target}")
  # echo "${source} >> ${target}"
  if [ -h "${target}" ]; then
    # echo "existing symlink"
    rm "${target}"
  elif [ -f "${target}" ]; then
    # echo "existing file"
    if ! [ -f "${target}.bak" ]; then
      mv "${target}" "${target}.bak"
    fi
  elif [ -d "${target}" ]; then
    # echo "existing directory"
    if ! [ -f "${target}.bak" ]; then
      mv "${target}" "${target}.bak"
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
    echo ""
    echo "export HOST_NAME=$(hostname -s)"
    echo "export SSH_PORT=22"
  } > "${HOME}/.bash_host"
fi

if ! [[ -e "${HOME}/.bash_user" ]]; then
  {
    echo "#!/bin/bash"
    echo ""
    echo "export USER_NAME=${USER}"
    echo "export USER_EMAIL="
  } > "${HOME}/.bash_user"
fi

if ! [[ -e "${HOME}/.ssh/config" ]]; then
  mkdir -p "${HOME}/.ssh/"
  touch "${HOME}/.ssh/config"
fi

source "${HOME}"/.bashrc