#!/usr/bin/env bash

set -euo pipefail

rofi_configs=$HOME/.config/rofi

dmenu() {
  local config=$1
  shift
  rofi -dmenu -i -config "$rofi_configs"/"$config".rasi "$@"
}

mode() {
  local mode=$1
  local config=$2
  shift 2
  rofi -show "$mode" -modes "$mode" -config "$rofi_configs"/"$config".rasi "$@"
}

app_launcher() {
  rofi -show drun -config "$rofi_configs"/app_launcher.rasi
}

dmenu_launcher() {
  dmenu action_launcher "$@" # TODO: style make slim, exact number of items? two columns?
}

cliphist_launcher() {
  dmenu cliphistory -display-columns 2 # TODO: try to put title
}

theme_launcher() {
  mode theme theme
}
