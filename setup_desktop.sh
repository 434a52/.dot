#!/bin/bash
set -e

./dotrc.sh --os_name=UBUNTU --os_type=DESKTOP

if ! [[ -d "${DOT}" ]]; then
  "${DOT}"/install/git.sh
  git clone https://github.com/434a52/.dot.git "${DOT}"
fi

"${DOT}"/setup.sh --install-tools
