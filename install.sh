#!/usr/bin/bash

set -euo pipefail

echo "Checking all required packages are installed"
while read -r pkg; do
  which "$pkg"
done <"./requirements.txt"

echo "Overriding old configurations"
for conf in fish tmux nvim; do
  rm -rf "$HOME/.config/$conf"
  ln -s "$(pwd)/.config/$conf" "$HOME/.config"
done

echo "Installing fish plugins"
fisher install "$(cat "$HOME/.config/fish/fish_plugins")"

echo "Installing tpm plugins"
tpm_path="$HOME/.local/share/tmux/plugins/tpm"
git clone https://github.com/tmux-plugins/tpm "$tpm_path"
chmod +x "$HOME/config/tmux/scripts/*.fish"
"$tpm_path/bin/install_plugins.sh"
