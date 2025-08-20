#!/usr/bin/env bash

update-desktop-database ~/.local/share/applications

if [ -f /usr/bin/imv ]; then
  xdg-mime default imv.desktop image/png
  xdg-mime default imv.desktop image/jpeg
  xdg-mime default imv.desktop image/gif
  xdg-mime default imv.desktop image/webp
  xdg-mime default imv.desktop image/bmp
  xdg-mime default imv.desktop image/tiff
fi

if [ -f /usr/bin/zathura ]; then
  xdg-mime default zathura.desktop application/pdf
fi

if [ -f /usr/bin/qutebrowser ]; then
  xdg-settings set default-web-browser qutebrowser.desktop
  xdg-mime default qutebrowser.desktop x-scheme-handler/http
  xdg-mime default qutebrowser.desktop x-scheme-handler/https
fi

if [ -f /usr/bin/mpv ]; then
  xdg-mime default mpv.desktop video/mp4
  xdg-mime default mpv.desktop video/x-msvideo
  xdg-mime default mpv.desktop video/x-matroska
  xdg-mime default mpv.desktop video/x-flv
  xdg-mime default mpv.desktop video/x-ms-wmv
  xdg-mime default mpv.desktop video/mpeg
  xdg-mime default mpv.desktop video/ogg
  xdg-mime default mpv.desktop video/webm
  xdg-mime default mpv.desktop video/quicktime
  xdg-mime default mpv.desktop video/3gpp
  xdg-mime default mpv.desktop video/3gpp2
  xdg-mime default mpv.desktop video/x-ms-asf
  xdg-mime default mpv.desktop video/x-ogm+ogg
  xdg-mime default mpv.desktop video/x-theora+ogg
  xdg-mime default mpv.desktop application/ogg
fi
