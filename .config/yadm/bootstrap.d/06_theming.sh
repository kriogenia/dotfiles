#!/usr/bin/env bash

if [ -f /usr/bin/gsettings ]; then
  echo "Prefering dark theme as a good code dweller"
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
  echo "Setting icons"
  gsettings set org.gnome.desktop.interface icon-theme Tela-circle-green
fi

if [ -f /usr/bin/hyprctl ]; then
  echo "Setting cursor"
  hyprctl setcursor catppuccin-macchiato-light-cursors 32
fi
