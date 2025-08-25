#!/usr/bin/env bash

CONFIG_DIR=${XDG_CONFIG_HOME:-"${HOME}/.config"}/dotfiles
LAUNCHER_FILE=$CONFIG_DIR/${1:-start}.yml
PLACEHOLDER=$(yq -r ".placeholder" <"$LAUNCHER_FILE")

option=$(yq -r ".options.[].text" "$LAUNCHER_FILE" | walker --dmenu --placeholder "$PLACEHOLDER")
content=$(yq ".options.[] | select(.text == \"$option\")" "$LAUNCHER_FILE")

# function get_prop
# function open webpage

case $(echo "$content" | yq -r ".type") in
*launcher*) "$(pwd)"/action_launcher.sh "$(echo "$content" | yq -r ".name")" ;;
*url*) xdg-open "$(echo "$content" | yq -r ".url")" ;; # open in new instance?
*) echo "Unknown option" ;;
esac
