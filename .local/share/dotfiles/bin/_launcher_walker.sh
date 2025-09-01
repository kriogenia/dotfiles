#!/usr/bin/env bash

set -euo pipefail

not_implemented() {
  notify-send -a "df Launcher" -u low "Not implemented" "This launcher doesn't support $1"
}

app_launcher() {
  walker
}

dmenu_launcher() {
  SEARCHBOX_ICON=$(echo "$SEARCHBOX_ICON" | tr -d '"')
  SEARCHBOX_PLACEHOLDER=$(echo "$SEARCHBOX_PLACEHOLDER" | tr -d '"')
  walker --dmenu --width 250 --theme dmenu --placeholder "$SEARCHBOX_ICON $SEARCHBOX_PLACEHOLDER" "$@"
}

cliphist_launcher() {
  not_implemented "Clipboard History"
}

theme_launcher() {
  not_implemented "Theme Color Picker"
}
