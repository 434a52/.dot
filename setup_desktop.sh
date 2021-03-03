#!/bin/bash

DOT="${HOME}"/.dot

if ! [[ -d "${DOT}" ]]; then
  git clone https://github.com/434a52/.dot.git "${DOT}"
fi

"${DOT}"/dotrc.sh --os_name=UBUNTU --os_type=DESKTOP
"${DOT}"/setup.sh --install-tools
