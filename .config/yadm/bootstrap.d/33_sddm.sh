#!/usr/bin/env bash

SDDM_THEME=/usr/share/sddm/themes/silent
if [ -d $SDDM_THEME ]; then
  echo "Setting up custom SDDM theme"
  sudo cp -r --dereference "$XDG_CONFIG_HOME"/sddm/* $SDDM_THEME

  echo "Skipping live wallpaper download (https://motionbgs.com/outer-wilds)"

  sudo chmod +x $SDDM_THEME/test.sh
  echo "Remember to test the wallpaper via \`cd $SDDM_THEME && ./test.sh\` before rebooting"
fi
