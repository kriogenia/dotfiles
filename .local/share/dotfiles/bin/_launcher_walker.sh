#!/usr/bin/env bash

set -euo pipefail

app_launcher() {
  walker
}

dmenu_launcher() {
  SEARCHBOX_ICON=$(echo "$SEARCHBOX_ICON" | tr -d '"')
  SEARCHBOX_PLACEHOLDER=$(echo "$SEARCHBOX_PLACEHOLDER" | tr -d '"')
  walker --dmenu --width 250 --theme dmenu --placeholder "$SEARCHBOX_ICON $SEARCHBOX_PLACEHOLDER" "$@"
}
