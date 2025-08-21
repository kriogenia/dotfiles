# easier to do this than manually uncheck in the Calamres installer
echo "Removing packages bundled not wanted"
sudo pacman -R --noconfirm \
  alacritty \
  cachyos-alacritty-config \
  cachyos-hyprland-settings \
  micro \
  nano \
  wofi \
  &>/dev/null

if [ "$(hostname)" = umbreon ]; then
  sudo pacman -R --noconfirm brightnessctl &>/dev/null
fi
