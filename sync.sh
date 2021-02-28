#!/bin/bash
# shellcheck disable=1090
set -e

cd "${HOME}/.dot"
git pull --ff-only

source "${HOME}/.bashrc"