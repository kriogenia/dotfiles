#!/usr/bin/env bash

set -euo pipefail

DOTFILES_LAUNCHER=${DOTFILES_LAUNCHER:-rofi}
# shellcheck source=/dev/null
source "$DOTFILES_BIN"/_launcher_"$DOTFILES_LAUNCHER".sh

print_help() {
  cat <<EOF
Usage: $0 <command>

Commands:
  action [submenu]    Launches the actions runner
                      Optionally takes the name of a submenu from $DOTFILES_CONFIG to run
  app                 Launches the app launcher
  help                Show this help message
  -h, --help          Same as 'help'

Environment variables:
  DOTFILES_LAUNCHER   Controls which launcher to use.
                      Supported options: [rofi|walker]. By default: 'rofi'.

Examples:
  $0 app
  DOTFILES_LAUNCHER=walker $0 action
  DOTFILES_LAUNCHER=walker $0 action documentation
EOF
}

if [[ $# -lt 1 ]]; then
  echo "Error: missing argument" >&2
  print_help
  exit 1
fi

action_launcher() {
  launcher_file=$DOTFILES_CONFIG/${1:-main}.yml

  SEARCHBOX_ICON=$(yq ".icon" <"$launcher_file")
  SEARCHBOX_PLACEHOLDER=$(yq ".placeholder" <"$launcher_file")
  export SEARCHBOX_ICON SEARCHBOX_PLACEHOLDER

  option=$(yq -r ".options.[].text" "$launcher_file" | dmenu_launcher)
  unset SEARCHBOX_ICON SEARCHBOX_PLACEHOLDER

  content=$(yq ".options.[] | select(.text == \"$option\")" "$launcher_file")

  run_app() {
    exec setsid uwsm app -- "$1"
  }

  get_prop() {
    echo "$content" | yq -r ".$1"
  }

  return_to_start() {
    if [ "$(basename "$launcher_file")" != "main.yml" ]; then
      action_launcher
    fi
  }

  case "$(get_prop type)" in
  app)
    run_app "$(get_prop exec)"
    ;;
  launcher)
    action_launcher "$(get_prop name)"
    ;;
  script)
    "$DOTFILES_BIN"/"$(get_prop name)" "$(get_prop args)"
    ;;
  url)
    xdg-open "$(get_prop url)"
    ;;
  *) return_to_start ;;
  esac
}

case "$1" in
app)
  app_launcher
  ;;
action)
  action_launcher
  ;;
-h | --help | help)
  print_help
  ;;
*)
  echo "Error: unknown argument '$1'" >&2
  print_help
  exit 1
  ;;
esac
