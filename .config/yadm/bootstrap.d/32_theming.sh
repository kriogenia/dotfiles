#!/usr/bin/env bash

source environment
source functions

if (pkg_installed gsettings); then
  echo "Prefering dark theme as a good code dweller"
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
  echo "Setting icons"
  gsettings set org.gnome.desktop.interface icon-theme Tela-circle-green
fi

if (pkg_installed hyprctl); then
  echo "Setting cursor"
  hyprctl setcursor catppuccin-macchiato-light-cursors "$_CURSOR_SIZE"
fi
