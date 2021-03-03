#!/bin/bash

if ! [ -e "${HOME}/bin/micro" ]; then
  ( cd "${HOME}"/bin && curl https://getmic.ro | zsh )
fi

if ! [ -d "${DOT}/res/firacode" ]; then
  mkdir -p "${DOT}/res/"
  curl -o "${DOT}/res/firacode" https://github.com/tonsky/FiraCode/tree/master/distr/ttf
fi
