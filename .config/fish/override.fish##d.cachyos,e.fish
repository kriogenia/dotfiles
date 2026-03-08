set -g BROWSER qutebrowser

set -g PACKAGE_TEMPLATE $XDG_STATE_HOME/dotfiles/pacman.lst##template

set -gx TORRENT_DIR $HOME/Downloads/torrent
set -gx MEDIA_SERIES /srv/media/series

function _check_pkg_installed -d "OS specific package installation check" \
    -a package
    pacman -Q $package &>/dev/null
end
