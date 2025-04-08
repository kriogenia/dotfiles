# WSL
set -g notes $HOME/notes/
set -g projects $HOME/projects/
set -g learning $projects/my_learnings/

set -g firefox /mnt/c/Program\x20Files/Mozilla\x20Firefox/firefox.exe
set -g BROWSER $firefox

set -g PYENV_ROOT $HOME/.pyenv
set -g SDKMAN_DIR $HOME/.sdkman
set -g XDG_CONFIG_HOME $HOME/.config

# Starts D-Bus to allow Zathura to open from nvim
eval (dbus-launch --csh-syntax | head -1 | sed 's/setenv/set/')
