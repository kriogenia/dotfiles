-- style

local font = "Fira Sans"
local msfont = "FiraCode Nerd Font"
local fontsize = 16

-- apps

local run = "uwsm app --"

local terminal = run .. " kitty"

local bar = "$DOTFILES_BIN/waybar.sh"
local browser = run .. "  qutebrowser"
local editor = terminal .. " nvim"
local explorer = terminal .. " lf"
local idle_handler = "hypridle"
local lockscreen = "hyprlock"
local notification_daemon = "swaync"
local notification_panel = "swaync-client -t -sw"

local launcher = "$DOTFILES_BIN/launcher.sh"

local altbrowser = run .. " zen-browser"
local altexplorer = run .. "  thunar"

local screenshot = 'grim -g "$(slurp)" - | swappy -f -'
