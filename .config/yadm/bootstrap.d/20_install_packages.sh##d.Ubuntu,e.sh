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
brew install fzf

echo "Installing Python CLIs using pipx"
pipx install poetry

echo "Installing crates"
cargo install tree-sitter-cli
