if [ -f /usr/bin/gsettings ]; then
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
  gsettings set org.gnome.desktop.interface icon-theme Tela-circle-green
fi

if [ -f /usr/bin/hyprctl ]; then
  hyprctl setcursor catppuccin-macchiato-light-cursors 32
fi
