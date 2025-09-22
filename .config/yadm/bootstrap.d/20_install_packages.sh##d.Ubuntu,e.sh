#!/usr/bin/env bash

echo "Found Ubuntu"
pkgs=$HOME/.local/state/dotfiles

echo "Installing APT packages"
xargs -a "$pkgs/apt.lst" sudo apt install -y

echo "Installing snaps"
while IFS= read -r line || [ -n "$line" ]; do
  [[ -z "$line" || "$line" =~ ^# ]] && continue
  sudo snap install "$line"
done <"$pkgs/snap.lst"
