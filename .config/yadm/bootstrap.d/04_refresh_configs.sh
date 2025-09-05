#!/usr/bin/env bash

echo "Building bat cache"
bat cache --build

echo "Installing fish plugins"
fish -c "cat $HOME/.config/fish/fish_plugins | fisher install -"
