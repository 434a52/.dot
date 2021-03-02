#!/bin/bash
# shellcheck disable=1090
set -euo pipefail

if [ -e "${HOME}/.dotrc" ]; then

  source "${HOME}/.dotrc"

  if [[ "$*" =~ "--install-tools" ]]; then
    "${HOME}/.dot/install/tools.sh"
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

  if ! [[ -e "${HOME}/.dir_list" ]]; then
    {
      echo "home=${HOME}"
      echo "dot=${HOME}/.dot"
      echo "code=${HOME}/code"
    } > "${HOME}/.dir_list"
  fi

  if ! [[ -e "${HOME}/.ssh/config" ]]; then
    mkdir -p "${HOME}/.ssh/"
    touch "${HOME}/.ssh/config"
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

  if [ "${OS_NAME}" == "UBUNTU" ]; then
    link .bashrc
    source "${HOME}/.bashrc"
  elif [ "${OS_NAME}" == "MAC" ]; then
    {
      echo ""
      echo "#>"
      echo source "${HOME}/.dotrc"
      echo source "${DOT}/aliases"
      echo source "${DOT}/functions"
      echo "#>"
    } >> "${HOME}/.zshrc"
  fi

  cd "${DOT}"
  for file in bin/*.sh; do
    [ -e "${file}" ] || continue
    link "${file}"
  done

fi
