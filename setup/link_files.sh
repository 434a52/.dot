#!/bin/bash

function link {

  source="${HOME}/.dotfile/${1}"
  target="${HOME}/${1}"
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

  mkdir --parents "${target_directory}"
  ln -sfn "${source}" "${target}"
}

link .bashrc
