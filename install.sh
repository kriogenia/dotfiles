#!/usr/bin/bash

set -euo pipefail

dotfiles="$(dirname "$(realpath "$0")")"

if which pacman &>/dev/null; then
  echo "Checking all required packages are installed"
  while read -r pkg; do
    if ! pacman -Q "$pkg"; then
      echo "Missing $pkg, installing:"
      yes | pacman -S "$pkg"
    fi
  done <"$dotfiles/requirements.txt"
fi

user_home=${USER_HOME:-$HOME}
config=${XDG_CONFIG_HOME:-$user_home/.config}
mkdir -p "$config"

echo "Overriding old configurations"
for app in bat eza fish gh hypr kitty lazygit nvim qutebrowser tmux wlogout; do
  echo "> $app"
  rm -rf "$config/${app:?}"
  ln -s "$dotfiles/.config/$app" "$config"
done
for app in cargo rustup ssh; do
  echo "> $app"
  mkdir -p "$user_home/.$app"
  for file in "$dotfiles"/".$app"/*; do
    ln -s "$file" "$user_home/.$app"
  done
done
echo "> gitconfig"
ln -s "$dotfiles/.gitconfig" "$user_home/"

echo "Installing fish plugins"
fish_plugins=$(tr '\n' ' ' <"$config/fish/fish_plugins")
fish -c "fisher_path=$user_home/.local/share/fish/plugins fisher install $fish_plugins"

if [[ ! -d "$user_home/.sdkman" ]]; then
  echo "Installing SDKMAN"
  fish -c "yes | sdk"
fi

echo "Dotfiles installed"
