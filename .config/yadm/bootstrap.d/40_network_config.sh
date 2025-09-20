#!/usr/bin/env bash

if [ -f /usr/bin/kdeconnect-app ]; then
  sudo ufw allow 1714:1764/tcp comment "kde-connect"
  sudo ufw allow 1714:1764/udp comment "kde-connect"
  sudo ufw reload
fi
