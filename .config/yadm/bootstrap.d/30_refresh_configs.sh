#!/usr/bin/env fish

echo "Building bat cache"
bat cache --build

echo "Installing fish plugins"
fish -C "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && cat $HOME/.config/fish/fish_plugins | fisher install -"
