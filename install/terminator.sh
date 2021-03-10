#!/bin/bash

if [ -z "$(which terminator)" ]; then
  
  sudo add-apt-repository ppa:gnome-terminator
  sudo apt update
  sudo apt install -y terminator

  {
    echo "/* #|> */"
    echo "VteTerminal, vte-terminal {"
    echo "  padding: 10px 0 0 10px;"
    echo "}"
    echo "/* #<| */"
  } >> "${HOME}"/.config/gtk-3.0/gtk.css

  link "${DOT}"/config/terminator/config "${HOME}"/.config/terminator/config

fi
