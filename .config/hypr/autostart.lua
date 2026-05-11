-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                    Autostart Configuration                  ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

require("./alt/autostart.conf")

hl.on("hyprland.start", function()
	hl.exec_cmd(idle_handler .. " &")
	hl.exec_cmd("swaybg -o * -i $HOME/.local/share/dotfiles/wallpapers/ow_ultrawide_macchiato.jpg -m fill")
	hl.exec_cmd("wl-paste --watch cliphist store &")
	hl.exec_cmd(notification_daemon .. "&")
	hl.exec_cmd(terminal)
end)
