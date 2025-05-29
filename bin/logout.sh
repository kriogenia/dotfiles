#!/usr/bin/env bash

hypr_border_radius() {
  hyprctl -j getoption decoration:rounding | jq '.int'
}

focus_monitor_info() {
  hyprctl -j monitors | jq '.[] | select(.focused=true)'
}

monitor_width=$(focus_monitor_info | jq '.width')
monitor_height=$(focus_monitor_info | jq '.height')
monitor_scale=$(focus_monitor_info | jq '.scale' | sed 's/\.//')
hypr_br=$(hypr_border_radius)

export _border_radius=$((hypr_br * 5))
export _icon_border_radius=$((hypr_br * 8))
export _width_hover_margin=$((monitor_width * 32 / monitor_scale))
export _height_hover_margin=$((monitor_height * 20 / monitor_scale))
export _width_icon_margin=$((monitor_width * 35 / monitor_scale))
export _height_icon_margin=$((monitor_height * 25 / monitor_scale))

css_file="$(envsubst <"$HOME/.config/wlogout/style.css")"

wlogout -b 2 -c 0 -r 0 -m 0 --css <(
  echo "${css_file}"
) --protocol layer-shell
