#!/usr/bin/env bash

source functions

if (pkg_installed kdeconnect); then
  echo "Making kdesh easily accesible for KDE connect"
  sudo ln -s "$HOME"/.local/bin/kdesh /usr/bin/

  if (pkg_installed ufw); then
    echo "Opening KDE connect ports in firewall"
    sudo ufw allow 1714:1764/tcp comment "kde-connect"
    sudo ufw allow 1714:1764/udp comment "kde-connect"
    sudo ufw reload
  fi

  if (pkg_installed plex-media-server); then
    echo "Removing need for password when activating/disabling plexmediaserver"
    echo "$(whoami) ALL=(ALL) NOPASSWD: /usr/bin/systemctl start plexmediaserver.service" >>/etc/sudoers.d/kde
    echo "$(whoami) ALL=(ALL) NOPASSWD: /usr/bin/systemctl stop plexmediaserver.service" >>/etc/sudoers.d/kde
  fi
fi
