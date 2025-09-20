#!/usr/bin/env bash

source functions

if (pkg_installed kdeconnect); then
  sudo ufw allow 1714:1764/tcp comment "kde-connect"
  sudo ufw allow 1714:1764/udp comment "kde-connect"
  sudo ufw reload
fi
