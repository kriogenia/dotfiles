#!/usr/bin/env sh

killall waybar >/dev/null && exit
while pgrep -x waybar >/dev/null; do sleep 1; done

# Launch main from $HOME so we can resolve icons
cd "$HOME" || exit
waybar &
