#!/usr/bin/env bash

mkdir ~/.fonts
cd ~/.fonts || exit 1
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip
unzip FiraCode.zip
rm FiraCode.zip
fc-cache -fv
