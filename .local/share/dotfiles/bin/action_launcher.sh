#!/usr/bin/env bash

launcher_file=$DOTFILES_CONFIG/${1:-start}.yml
echo $launcher_file
placeholder=$(yq -r ".placeholder" <"$launcher_file")

option=$(yq -r ".options.[].text" "$launcher_file" | walker --dmenu --width 250 --theme dmenu --placeholder "$placeholder")
content=$(yq ".options.[] | select(.text == \"$option\")" "$launcher_file")

launch() {
  "${DOTFILES_BIN}"/action_launcher.sh "$@"
}

run_app() {
  exec setsid uwsm app -- "$1"
}

get_prop() {
  echo "$content" | yq -r ".$1"
}

return_to_start() {
  if [ "$(basename "$launcher_file")" != "start.yml" ]; then
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
