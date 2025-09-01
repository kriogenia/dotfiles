#!/usr/bin/env bash

if [ -n "$1" ]; then
  echo "$1" | wl-copy -n
  exit 0
fi

echo -en "\0markup-rows\x1ftrue\n"
awk '{gsub(";","",$3); printf "%s\0meta\x1f%s\x1fdisplay\x1f<span foreground=\"%s\"></span> %s\n", $3, $2, $3, $2}' "$DOTFILES_DATA"/palette/current.css
