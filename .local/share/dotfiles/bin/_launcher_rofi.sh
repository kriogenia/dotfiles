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
  export LIST_TITLE='" Clipboard history"'
  dmenu bottom_list -display-columns 2
}

emoji_launcher() {
  export LIST_TITLE='"󰞅 Emoji selector"'
  rofi -modi emoji -show emoji -config bottom_list
}

game_launcher() {
  mode games games
}

theme_launcher() {
  mode theme theme
}
