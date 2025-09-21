pkg_installed() {
  pacman -Q "$1" &>/dev/null
}
