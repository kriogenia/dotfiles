#!/usr/bin/env bash

echo "Found Ubuntu"
pkgs=$HOME/.local/state/dotfiles

echo "Adding additional repositories"
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo add-apt-repository ppa:fish-shell/release-4
sudo apt update

echo "Installing APT packages"
xargs -a "$pkgs/apt.lst" sudo apt install -y

echo "Installing snaps"
while IFS= read -r line || [ -n "$line" ]; do
  [[ -z "$line" || "$line" =~ ^# ]] && continue
  sudo snap install $line
done <"$pkgs/snap.lst"

if [ ! -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
  echo "Hombrew not found, installing"
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo >> $HOME/.bashrc
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.bashrc
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

echo "Installing brews"
xargs brew install < "$pkgs/brew.lst"

echo "Installing Python versions and CLIs"
pyenv install 3.11.4
pipx install poetry

echo "Installing crates"
cargo install tree-sitter-cli

echo "Installing from sources"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
curl -s "https://get.sdkman.io" | bash

sudo apt autoremove
