# WSL
set -g notes $HOME/notes/
set -g projects $HOME/projects

set -g firefox /mnt/c/Program\x20Files/Mozilla\x20Firefox/firefox.exe
set -g BROWSER $firefox

# Starts D-Bus to allow Zathura to open from nvim
eval (dbus-launch --csh-syntax | head -1 | sed 's/setenv/set/')
