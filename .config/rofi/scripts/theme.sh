#!/usr/bin/env bash

if [ -n "$1" ]; then
  echo "$1" | wl-copy -n
  exit 0
fi

echo -en "\0markup-rows\x1ftrue\n"

while IFS='=' read -r name value; do
  printf "%s\0meta\x1f%s\x1fdisplay\x1f<span foreground=\"%s\"></span> %s\n" "$value" "$name" "$value" "$name"
done <"$DOTFILES_DATA"/palette/current
