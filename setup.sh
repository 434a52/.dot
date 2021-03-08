#!/bin/bash
# shellcheck disable=1090
set -e

"${HOME}"/.dot/dotrc.sh
source "${HOME}"/.dotrc

if ! [[ -d "${HOME}/bin" ]]; then
  mkdir "${HOME}/bin"
fi

if ! [[ -d "${HOME}/code" ]]; then
  mkdir "${HOME}/code"
fi

if ! [[ -e "${HOME}/code/repo-list" ]]; then
  touch "${HOME}/code/repo-list"
fi

if ! [[ -e "${HOME}/.dot_dirs" ]]; then
  {
    echo "home=${HOME}"
    echo "dot=${HOME}/.dot"
    echo "code=${HOME}/code"
  } > "${HOME}/.dot_dirs"
fi

if ! [[ -e "${HOME}/.ssh/config" ]]; then
  mkdir -p "${HOME}/.ssh/"
  touch "${HOME}/.ssh/config"
fi

function link {
  source="${HOME}"/.dot/${1}
  target="${HOME}"/${1}
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

link .editorconfig

for file in "${HOME}/bin/*"; do
  if [ -h "${file}" ]; then
    # if [  ]; then
    #   rm "${file}"
    # fi
    echo ""
  fi
done

for file in "${DOT}"/bin/*; do
  if [ -f "${file}" ]; then
    link "/bin/$(basename "${file}")"
  fi
done

if [ "${OS_NAME}" = "UBUNTU" ]; then
  if [[ "$*" =~ "--install-tools" ]]; then
    "${HOME}"/.dot/install/ubuntu_tools.sh
  fi
  link .bashrc
  source "${HOME}"/.bashrc

elif [ "${OS_NAME}" = "MAC" ]; then
  if [[ "$*" =~ "--install-tools" ]]; then
    "${HOME}"/.dot/install/mac_tools.sh
  fi
  touch "${HOME}"/.hushlogin
  ln -s "${DOT}"/lib/dot.zsh-theme "${ZSH}"/themes
  c-conf --clear file="${HOME}"/.zshrc
  {
    echo "#|>"
    echo source "${HOME}/.dotrc"
    echo source "${DOT}/lib/zshrc"
    echo "#<|"
  } >> "${HOME}"/.zshrc
  exec zsh
  
fi
