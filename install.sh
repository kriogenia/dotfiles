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

echo "Setting up tmux"
tpm_path="$HOME/.local/share/tmux/plugins/tpm"
git clone https://github.com/tmux-plugins/tpm "$tpm_path"
chmod +x ./.config/tmux/scripts/*.fish
ln -s "$(pwd)/.config/tmux" "$HOME/.config/tmux"
"$tpm_path/bin/install_plugins.sh"
