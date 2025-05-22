#!/usr/bin/bash

set -euo pipefail

dotfiles="$(dirname "$(realpath "$0")")"

echo "Checking all required packages are installed"
while read -r pkg; do
  which "$pkg"
done <"./requirements.txt"

config=${XDG_CONFIG_HOME:-$HOME/.config}
echo "Overriding old configurations"
for app in bat fish tmux nvim eza kitty gh; do
  echo "> $app"
  rm -rf "$config/${app:?}"
  ln -s "$dotfiles/.config/$app" "$config"
done

# TODO improve this
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

echo "Copying other configs"
for app in ssh rustup; do
  echo "> $app"
  mkdir -p "$HOME/.$app"
  for file in "$dotfiles"/".$app"/*; do
    ln -s "$file" "$HOME/.$app"
  done
done

ln -s "$(pwd)/.gitconfig" "$HOME/"

echo "Dotfiles installed"
