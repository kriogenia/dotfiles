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

if [ ! -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
  echo "Hombrew not found, installing"
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing brews"
brew install fzf pyenv vespa-cli

echo "Installing Python versions and CLIs"
pyenv install 3.11.4
pipx install poetry

echo "Installing crates"
cargo install tree-sitter-cli

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
curl -s "https://get.sdkman.io" | bash

sudo apt autoremove
