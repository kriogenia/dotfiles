#!/usr/bin/env bash

set -euo pipefail

DOTFILES_LAUNCHER=${DOTFILES_LAUNCHER:-rofi}
# shellcheck source=/dev/null
source "$DOTFILES_BIN"/_launcher_"$DOTFILES_LAUNCHER".sh

print_help() {
  cat <<EOF
Usage: $0 <command>

Commands:
  app        Launches the app launcher
  help       Show this help message
  -h, --help Same as 'help'

Environment variables:
  DOTFILES_LAUNCHER   Controls which launcher to use.
                      Supported options: [rofi|walker]. By default: 'rofi'.

Examples:
  $0 app
  DOTFILES_LAUNCHER=walker $0 app
EOF
}

if [[ $# -lt 1 ]]; then
  echo "Error: missing argument" >&2
  print_help
  exit 1
fi

case "$1" in
app)
  app_launcher
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
