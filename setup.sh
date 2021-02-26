#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [[ "$*" =~ "--install" ]]; then
  "${HOME}"/.dotfiles/scripts/install_common.sh  
fi

"${HOME}"/.dotfiles/scripts/link_files.sh
"${HOME}"/.dotfiles/scripts/copy_files.sh
