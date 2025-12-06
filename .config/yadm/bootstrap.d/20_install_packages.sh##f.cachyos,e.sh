#!/usr/bin/env bash

echo "Found CachyO"
pkgs=$HOME/.local/state/dotfiles

echo "Installing Arch packages"
sudo pacman --noconfirm --needed -S $(cat $pkgs/pacman.lst)

echo "Installing AUR packages"
paru --noconfirm -S $(cat $pkgs/aur.lst)
