#!/usr/bin/env bash

if [ -f /usr/bin/flatpak ]; then
  echo "Installing flatpaks"
  sudo flatpak -y install $(cat $HOME/.local/state/dotfiles/flatpak.lst)
fi
