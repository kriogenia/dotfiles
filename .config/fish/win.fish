# WSL
set -g notes /home/sotoestevez/notes/
set -g projects /home/sotoestevez/projects/
set -g learning /home/sotoestevez/projects/my_learnings/

set -g firefox /mnt/c/Program\x20Files/Mozilla\x20Firefox/firefox.exe
set -g BROWSER $firefox

# Starts D-Bus to allow Zathura to open from nvim
eval (dbus-launch --csh-syntax | head -1 | sed 's/setenv/set/')
