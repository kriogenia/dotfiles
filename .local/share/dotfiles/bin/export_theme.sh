#!/usr/bin/env bash

declare -A THEME
while IFS='=' read -r name value; do
  THEME[$name]=$value
done <"$DOTFILES_THEME/palette"
export THEME
