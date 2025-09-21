#!/usr/bin/env bash

echo "Found Ubuntu"
pkgs=$HOME/.local/state/dotfiles

echo "Installing APT packages"
xargs -a "$pkgs/apt.lst" sudo apt install -y
