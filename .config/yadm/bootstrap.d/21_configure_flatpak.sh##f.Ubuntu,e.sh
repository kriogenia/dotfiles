#!/usr/bin/env bash

if [ -f /usr/bin/flatpak ]; then
  echo "Adding flatpak repositories"
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
fi
