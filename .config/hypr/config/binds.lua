local mainMod = "SUPER"

-- Apps

local bar = "$DOTFILES_BIN/waybar.sh"
local browser = RUN .. "qutebrowser"
local editor = TERMINAL .. " nvim"
local explorer = TERMINAL .. " lf"
local lock_screen = "hyprlock"
local notification_panel = "swaync-client -t -sw"

local launcher = "$DOTFILES_BIN/launcher.sh"

local altbrowser = RUN .. "zen-browser"
local altexplorer = RUN .. "thunar"

local screenshot = 'grim -g "$(slurp)" - | swappy -f -'

-- Window Management

hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "Close focused window" })
hl.bind("ALT + F4", hl.dsp.exec_cmd("hyprctl dispatch killactive"), { description = "Close focused window" })

hl.bind(mainMod .. " + Delete", hl.dsp.exec_cmd("uwsm stop"), { description = "Kill Hyprland session" })

hl.bind(mainMod .. " + W", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })
hl.bind("SHIFT + F11", hl.dsp.window.fullscreen({ action = "toggle" }), { description = "Toggle fullscreen" })
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"), { description = "Toggle split" })

local directions = { "left", "right", "up", "down" }
for i = 1, #directions, 1 do
	d = directions[i]
	hl.bind(mainMod .. " + " .. d, hl.dsp.focus({ direction = d }), { description = "Focus " .. d })
	hl.bind(mainMod .. "+ SHIFT + " .. d, hl.dsp.window.swap({ direction = d }), { description = "Swap " .. d })
end

hl.bind("ALT + Tab", hl.dsp.layout("cyclenext"), { description = "Cycle focus" })

hl.bind(mainMod .. " + P", hl.dsp.submap("resize"), { description = "Activates windows resizing submap" })
hl.define_submap("resize", function()
	hl.bind("right", hl.dsp.window.resize({ x = 15, y = 0, relative = true }), { repeating = true })
	hl.bind("left", hl.dsp.window.resize({ x = -15, y = 0, relative = true }), { repeating = true })
	hl.bind("up", hl.dsp.window.resize({ x = 0, y = 15, relative = true }), { repeating = true })
	hl.bind("down", hl.dsp.window.resize({ x = 0, y = -15, relative = true }), { repeating = true })

	hl.bind("l", hl.dsp.window.resize({ x = 15, y = 0, relative = true }), { repeating = true })
	hl.bind("h", hl.dsp.window.resize({ x = -15, y = 0, relative = true }), { repeating = true })
	hl.bind("k", hl.dsp.window.resize({ x = 0, y = 15, relative = true }), { repeating = true })
	hl.bind("j", hl.dsp.window.resize({ x = 0, y = -15, relative = true }), { repeating = true })

	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Session Management

hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(lock_screen), { description = "Lock screen" })
hl.bind("CONTROL + ALT + Delete", hl.dsp.exec_cmd("wlogout -b 6"), { description = "Open logout menu" })

-- Desktop Environment

hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(bar), { description = "Toggle shell" })
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(TERMINAL), { description = "Terminal emulator" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(explorer), { description = "File explorer" })
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(altexplorer), { description = "Visual file explorer" })
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser), { description = "Web browser" })
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(altbrowser), { description = "Alternate web browser" })
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(editor), { description = "Text editor" })
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(screenshot), { description = "Screen capture selection" })
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(notification_panel), { description = "Toggle notifications panel" })

-- Launcher

hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(launcher .. " action"), { description = "Actions runner" })
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(launcher .. " app"), { description = "Application launcher" })
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(launcher .. " clipboard"), { description = "Clipboard history" })
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd(launcher .. " games"), { description = "Game launcher" })

-- Hardware controls

hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("$DOTFILES_BIN/swap_kb.sh " .. KEYBOARD), { description = "Layout switch" })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Workspaces

for i = 1, 10 do
	local key = i % 10

	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }), { description = "Navigate to workspace " .. key })
	hl.bind(
		mainMod .. " + SHIFT + " .. key,
		hl.dsp.window.move({ workspace = i }),
		{ description = "Move to workspace " .. key }
	)
end

hl.bind(mainMod .. " + PERIOD", hl.dsp.focus({ workspace = "+1" }), { description = "Next workspace" })
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "+1" }), { description = "Next workspace" })
hl.bind(mainMod .. " + COMMA", hl.dsp.focus({ workspace = "-1" }), { description = "Previous workspace" })
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "-1" }), { description = "Previous workspace" })
hl.bind(mainMod .. " + slash", hl.dsp.focus({ workspace = "previous" }), { description = "Switch workspace back" })

hl.bind(mainMod .. " + minus", hl.dsp.workspace.toggle_special(), { description = "Toogle special workspace" })
hl.bind(
	mainMod .. " + grave", -- grave = `
	hl.dsp.workspace.toggle_special("communication"),
	{ description = "Toogle Discord workspace" }
)
hl.bind(
	mainMod .. " + SHIFT + minus",
	hl.dsp.window.move({ workspace = "special" }),
	{ description = "Move to special workspace" }
)

-- Override

require("config.alt.binds")
