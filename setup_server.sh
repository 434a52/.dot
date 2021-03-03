#!/bin/bash

./dotrc.sh --os_name=UBUNTU --os_type=SERVER

if ! [[ -d "${DOT}" ]]; then
  "${DOT}"/install/git.sh
  git clone https://github.com/434a52/.dot.git "${DOT}"
fi

"${DOT}"/setup.sh --install-tools
