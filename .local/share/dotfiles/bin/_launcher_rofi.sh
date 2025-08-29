#!/usr/bin/env bash

set -euo pipefail

rofi_configs=$HOME/.config/rofi

app_launcher() {
  rofi -show drun -config "$rofi_configs"/app_launcher.rasi
}

dmenu_launcher() {
  rofi -dmenu "$@" -config "$rofi_configs"/app_launcher.rasi
}
