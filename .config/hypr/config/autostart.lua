require("config.alt.autostart")

hl.on("hyprland.start", function()
	hl.exec_cmd(IDLE_HANDLER .. " &")
	hl.exec_cmd("swaybg -i $HOME/.local/share/dotfiles/wallpapers/ow_ultrawide_macchiato.jpg -m fill")
	hl.exec_cmd("wl-paste --watch cliphist store &")
	hl.exec_cmd(NOTIFICATION_DAEMON .. "&")
	hl.exec_cmd(TERMINAL)
end)
