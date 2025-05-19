#!/usr/bin/bash

set -euo pipefail

echo "Checking all required packages are installed"
while read -r pkg; do
  which "$pkg"
done <"./requirements.txt"

config=${XDG_CONFIG_HOME:-$HOME/.config}
echo "Overriding old configurations"
for conf in fish tmux nvim eza kitty gh; do
  rm -rf "$config/${conf:?}"
  ln -s "$(pwd)/.config/$conf" "$HOME/.config"
done

echo "Installing SDKMAN"
curl -s "https://get.sdkman.io" | bash

echo "Installing fish plugins"
fish_plugins=$(tr '\n' ' ' <"$config/fish/fish_plugins")
fish -c "fisher install $fish_plugins)"

echo "Installing tpm plugins"
tpm_path="$HOME/.local/share/tmux/plugins/tpm"
git clone https://github.com/tmux-plugins/tpm "$tpm_path"
chmod +x "$config"/tmux/scripts/*.fish
"$tpm_path/bin/install_plugins"

echo "Setting up other configs"
mkdir "$HOME/.ssh" && ln -s "$(pwd)/.ssh/config" "$HOME/.ssh"
ln -s "$(pwd)/.gitconfig" "$HOME/"

echo "Dotfiles installed"
