#!/usr/bin/bash

set -euxo pipefail

dotfiles="$(dirname "$(realpath "$0")")"

echo "Checking all required packages are installed"
while read -r pkg; do
  which "$pkg"
done <"$dotfiles/requirements.txt"

user_home=${USER_HOME:-$HOME}
config=${XDG_CONFIG_HOME:-$user_home/.config}
mkdir -p "$config"

echo "Overriding old configurations"
for app in bat fish tmux nvim eza kitty gh; do
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

echo "Installing tpm plugins"
export TMUX_PLUGIN_MANAGER_PATH="$user_home/.local/share/tmux/plugins"
tpm_path="$TMUX_PLUGIN_MANAGER_PATH/tpm"
git clone https://github.com/tmux-plugins/tpm "$tpm_path"
chmod -R +x "$config"/tmux/scripts
chmod -R +x "$config"/tmux/workspaces
"$tpm_path/bin/install_plugins"

echo "Dotfiles installed"
