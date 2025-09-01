#!/usr/bin/env bash

keyboard=$1

get_layout() {
  hyprctl devices -j | jq -r ".keyboards[] | select(.name==\"$keyboard\") | .active_keymap"
}

hyprctl switchxkblayout "$keyboard" next &>/dev/null

notify-send -u low -a Hyprland -i keyboard -e "Keyboard swapped to $(get_layout)"
