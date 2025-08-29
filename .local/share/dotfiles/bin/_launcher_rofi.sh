#!/usr/bin/env bash

set -euo pipefail

rofi_configs=$HOME/.config/rofi

dmenu() {
  local config=$1
  shift
  rofi -dmenu -config "$rofi_configs"/"$config".rasi "$@"
}

app_launcher() {
  rofi -show drun -config "$rofi_configs"/app_launcher.rasi
}

dmenu_launcher() {
  dmenu app_launcher "$@" # TODO: style make slim, exact number of items? two columns?
}

cliphist_launcher() {
  dmenu cliphistory -display-columns 2 # TODO: try to put title
}
