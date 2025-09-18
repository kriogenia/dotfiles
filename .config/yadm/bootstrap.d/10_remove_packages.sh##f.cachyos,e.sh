#!/usr/bin/env bash

pkgs=$HOME/.local/state/dotfiles
to_remove=$(pacman -Qq $(cat $pkgs/unwanted.lst) 2>/dev/null)

# easier to do this than manually uncheck in the Calamares installer
echo "Removing packages bundled not wanted"
echo "$to_remove"
[ -n "$to_remove" ] && sudo pacman -Runs --noconfirm $to_remove
# &>/dev/null
