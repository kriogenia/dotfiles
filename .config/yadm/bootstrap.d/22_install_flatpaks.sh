#!/usr/bin/env bash

source functions

if (pkg_installed flatpak); then
  echo "Installing flatpaks"
  sudo flatpak -y install $(cat $HOME/.local/state/dotfiles/flatpak.lst)
fi
