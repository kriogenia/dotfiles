#!/usr/bin/env bash

set -euo pipefail

dmenu() {
  local config=$1
  shift
  rofi -dmenu -i -config "$config" "$@"
}

mode() {
  local mode=$1
  local config=$2
  shift 2
  rofi -show "$mode" -modes "$mode" -config "$config" "$@"
}

app_launcher() {
  rofi -show drun -config app_launcher
}

dmenu_launcher() {
  dmenu action_launcher "$@"
}

cliphist_launcher() {
  dmenu cliphistory -display-columns 2
}

theme_launcher() {
  mode theme theme
}
