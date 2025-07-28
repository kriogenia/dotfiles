#!/usr/bin/env bash

echo "Found an ArchLinux distribution"
pkgs=$HOME/.local/state/dotfiles

echo "Installing Arch packages"
sudo pacman --noconfirm --needed -S $(cat $pkgs/pacman.lst)

if [ ! -f /usr/bin/yay ]; then
  echo "Installing yay as AUR helper"
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay
  makepkg --noconfirm --needed -si
  rm -rf /tmp/yay
fi

echo "Installing AUR packages"
yay --noconfirm -S $(cat $pkgs/aur.lst)
