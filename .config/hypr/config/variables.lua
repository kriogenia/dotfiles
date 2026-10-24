-- style

font = "Fira Sans"
msfont = "FiraCode Nerd Font"
fontsize = 16

RUN = "uwsm app -- "

IDLE_HANDLER = "systemctl --user enable --now hypridle.service"
NOTIFICATION_DAEMON = "swaync"
TERMINAL = RUN .. "kitty"
