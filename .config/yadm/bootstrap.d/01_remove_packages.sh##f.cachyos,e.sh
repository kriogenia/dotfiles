#!/usr/bin/env bash

unwanted=(
  alacritty
  cachyos-alacritty-config
  cachyos-fish-config
  cachyos-hyprland-settings
  mako
  micro
  nano
  rofi
  rofi-emoji
  swaylock-fancy-git
  wofi
)
to_remove=$(pacman -Qq "${unwanted[@]}" 2>/dev/null)

# easier to do this than manually uncheck in the Calamares installer
echo "Removing packages bundled not wanted"
echo "$to_remove"
[ -n "$to_remove" ] && sudo pacman -Runs --noconfirm $to_remove
# &>/dev/null

if [ "$(hostname)" = umbreon ]; then
  sudo pacman -R --noconfirm brightnessctl &>/dev/null
fi
