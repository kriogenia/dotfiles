#!/usr/bin/env bash

CONFIG_DIR=${XDG_CONFIG_HOME:-"${HOME}/.config"}/dotfiles
LAUNCHER_FILE=$CONFIG_DIR/${1:-start}.yml
PLACEHOLDER=$(yq -r ".placeholder" <"$LAUNCHER_FILE")

option=$(yq -r ".options.[].text" "$LAUNCHER_FILE" | walker --dmenu --placeholder "$PLACEHOLDER")
content=$(yq ".options.[] | select(.text == \"$option\")" "$LAUNCHER_FILE")

launch() {
  "${XDG_DATA_HOME}"/dotfiles/bin/action_launcher.sh "$@"
}

run_app() {
  exec setsid uwsm app -- "$1"
}

get_prop() {
  local prop=$1
  echo "$content" | yq -r ".$prop"
}

return_to_start() {
  if [ "$(basename "$LAUNCHER_FILE")" != "start.yml" ]; then
    launch
  fi
}

case "$(get_prop type)" in
*app*)
  run_app "$(get_prop exec)"
  ;;
*launcher*)
  launch "$(get_prop name)"
  ;;
*url*)
  xdg-open "$(get_prop url)"
  ;;
*) return_to_start ;;
esac
