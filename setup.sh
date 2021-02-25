#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

${HOME}/.dotfiles/scripts/install_common.sh
${HOME}/.dotfiles/scripts/link_files.sh
${HOME}/.dotfiles/scripts/copy_files.sh
