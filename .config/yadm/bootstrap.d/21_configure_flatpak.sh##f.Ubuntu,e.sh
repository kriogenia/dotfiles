#!/usr/bin/env bash

source functions

if (pkg_installed flatpak); then
  echo "Adding flatpak repositories"
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
fi
