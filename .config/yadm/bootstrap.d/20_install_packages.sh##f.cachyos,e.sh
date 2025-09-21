#!/usr/bin/env bash

echo "Found CachyO"
pkgs=$HOME/.local/state/dotfiles

echo "Installing Arch packages"
sudo pacman --noconfirm --needed -S $(cat $pkgs/pacman.lst)
