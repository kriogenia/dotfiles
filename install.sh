#!/usr/bin/bash

set -euo pipefail

echo "Checking all required packages are installed"
while read -r pkg; do
  which "$pkg"
done <"./requirements.txt"

echo "Setting up fish"
rm -rf "$HOME/.config/fish"
ln -s "$(pwd)/.config/fish" "$HOME/.config/fish"
fisher install "$(cat "$HOME/.config/fish/fish_plugins")"

