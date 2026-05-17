require("themes.current")

hl.config({
	general = {
		layout = "dwindle",

		gaps_in = 5,
		gaps_out = 20,

		border_size = 2,

		col = {
			-- TODO: use vars
			active_border = { colors = { "#f5a97f", border_active_bottom_right }, angle = 45 },
			inactive_border = border_inactive,
		},

		resize_on_border = false,
		allow_tearing = false,
	},

	-- snap = {
	-- 	enabled = true,
	-- },

	dwindle = {
		force_split = 2,
		preserve_split = true,
		special_scale_factor = 0.95,
	},

	master = {
		new_status = "master",
		special_scale_factor = 0.9,
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = 0x1a1a1aee,
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	group = {
		groupbar = {
			font_family = msfont,
			font_size = fontsize,
			gradients = true,
			gradient_round_only_edges = false,
			gradient_rounding = 5,
			height = 25,
			indicator_height = 0,
			gaps_in = 3,
			gaps_out = 3,
		},
	},

	render = {
		direct_scanout = true,
	},

	misc = {
		font_family = font,
		splash_font_family = font,

		enable_swallow = true,
		swallow_regex = "^(cachy-browser|firefox|nautilus|nemo|thunar|btrfs-assistant.)$",

		focus_on_activate = true,
		vrr = 2,

		force_default_wallpaper = 1,
		disable_hyprland_logo = true,
	},

	animations = {
		enabled = true,
	},
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-- # Ref https://wiki.hyprland.org/Configuring/Workspace-Rules/
-- # "Smart gaps" / "No gaps when only"
-- # uncomment all if you wish to use that.
-- # workspace = w[tv1], gapsout:0, gapsin:0
-- # workspace = f[1], gapsout:0, gapsin:0
-- # windowrule = bordersize 0, floating:0, onworkspace:w[tv1]
-- # windowrule = rounding 0, floating:0, onworkspace:w[tv1]
-- # windowrule = bordersize 0, floating:0, onworkspace:f[1]
-- # windowrule = rounding 0, floating:0, onworkspace:f[1]
