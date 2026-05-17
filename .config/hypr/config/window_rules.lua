-- Window Rules

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

hl.window_rule({
	match = {
		class = "^(org.pulseaudio.pavucontrol)",
		float = true,
	},
})

hl.window_rule({
	match = {
		class = "^(Picture in picture)$",
		float = true,
	},
})

hl.window_rule({
	match = {
		class = "^(Save File)$",
		float = true,
	},
})

hl.window_rule({
	match = {
		class = "^(Open File)$",
		float = true,
	},
})

hl.window_rule({
	match = {
		class = "^(blueman-manager)$",
		float = true,
	},
})

hl.window_rule({
	match = {
		class = "^(xdg-desktop-portal-gtk|xdg-desktop-portal-kde|xdg-desktop-portal-hyprland)(.*)$",
		float = true,
	},
})

hl.window_rule({
	match = {
		class = "^(CachyOSHello)$",
		float = true,
	},
})

hl.window_rule({
	match = {
		class = "^(zenity)$",
		float = true,
	},
})

hl.window_rule({
	match = {
		class = "^()$",
		title = "^(Steam - Self Updater)$",
		float = true,
	},
})

hl.window_rule({
	match = {
		class = "^(thunar|nemo)$",
	},
	opacity = 0.92,
})

hl.window_rule({
	match = {
		class = "^(discord|webcord)$",
	},
	opacity = 0.96,
})

hl.window_rule({
	match = {
		title = "^(QQ|Telegram)$",
	},
	opacity = 0.95,
})

hl.window_rule({
	match = {
		title = "^(imv|danmufloat|termfloat|nemo|ncmpcpp)$",
	},
	float = true,
	move = "25%- 0%",
	size = { 960, 520 },
})

hl.window_rule({
	match = {
		title = "^(danmufloat)$",
	},
	pin = true,
})

hl.window_rule({
	match = {
		title = "^(danmufloat|termfloat)$",
	},
	rounding = 5,
})

hl.window_rule({
	match = {
		class = "^(kitty|Alacritty)$",
	},
	animation = "slide right",
})

hl.window_rule({
	match = {
		class = "^(org.mozilla.firefox)$",
	},
	no_blur = true,
})

hl.window_rule({
	match = {
		class = "^(mpv)$",
	},
	fullscreen = true,
})

hl.window_rule({
	name = "floating-windows-decoration",
	match = {
		float = true,
		workspace = "w[fv1-10]",
	},

	border_size = 2,
	border_color = cachylblue,
	rounding = 8,
})

hl.window_rule({
	name = "tiling-windows-decoration",
	match = {
		float = false,
		workspace = "w[fv1-10]",
	},

	border_size = 3,
	rounding = 4,
})

hl.window_rule({
	name = "special-workspace-belong",
	match = {
		class = "^(discord|equibop|vesktop|whatsapp)$",
	},
	workspace = "special:communication",
})

hl.window_rule({
	name = "picture-in-picture",
	match = {
		title = "^(Picture-in-Picture)$",
	},
	float = true,
	size = { 960, 540 },
	move = "25%- 0%",
})

hl.window_rule({
	name = "ship-log",
	match = {
		class = "^(fastfetch)$",
	},
	float = true,
	size = { 1440, 720 },
})

-- Workspace Rules

hl.workspace_rule({
	workspace = "w[tv1-10]",
	gaps_in = 3,
	gaps_out = 5,
})

hl.workspace_rule({
	workspace = "f[1]",
	gaps_in = 3,
	gaps_out = 5,
})

hl.workspace_rule({
	workspace = "special:communication",
	on_created_empty = RUN .. "discord.desktop",
})

-- Layer Rules

hl.layer_rule({
	match = {
		namespace = "logout_dialog",
	},
	animation = "slide top",
})

hl.layer_rule({
	match = {
		namespace = "waybar",
	},
	animation = "slide down",
})

hl.layer_rule({
	match = {
		namespace = "wallpaper",
	},
	animation = "fade 50%",
})
