-- Window Management

hl.bind(mainMod .. " + Q", hl.dsp.window.kill(), { description = "Close focused window" })
hl.bind("Alt + F4", hl.dsp.exec_cmd("hyprctl dispatch killactive"), { description = "Close focused window" })

hl.bind(mainMod .. " + Delete", hl.dsp.exec_cmd("uwsm stop"), { description = "Kill Hyprland session" })

hl.bind(mainMod .. " + W", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })
hl.bind("Shift + F11", hl.dsp.window.fullscreen({ action = "toggle" }), { description = "Toggle fullscreen" })
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"), { description = "Toggle split" })

hl.bind(mainMod .. " + Left", hl.dsp.focus("l"), { description = "Focus left" })
hl.bind(mainMod .. " + Right", hl.dsp.focus("r"), { description = "Focus right" })
hl.bind(mainMod .. " + Up", hl.dsp.focus("u"), { description = "Focus up" })
hl.bind(mainMod .. " + Down", hl.dsp.focus("d"), { description = "Focus down" })
hl.bind("Alt + Tab", hl.dsp.layout("cyclenext"), { description = "Cycle focus" })

hl.bind(mainMod .. "+ Shift + Left", hl.dsp.swap("l"), { description = "Swap left" })
hl.bind(mainMod .. "+ Shift + Right", hl.dsp.swap("r"), { description = "Swap right" })
hl.bind(mainMod .. "+ Shift + Up", hl.dsp.swap("u"), { description = "Swap up" })
hl.bind(mainMod .. "+ Shift + Down", hl.dsp.swap("d"), { description = "Swap down" })

hl.bind(mainMod .. " + R", hl.dsp.submap("resize"), { description = "Activates windows resizing submap" })

hl.define_submap("resize", function()
	hl.bind("right", hl.resize({ x = 15, y = 0, relative = true }), { repeating = true })
	hl.bind("left", hl.resize({ x = -15, y = 0, relative = true }), { repeating = true })
	hl.bind("up", hl.resize({ x = 0, y = 15, relative = true }), { repeating = true })
	hl.bind("down", hl.resize({ x = 0, y = -15, relative = true }), { repeating = true })

	hl.bind("l", hl.resize({ x = 15, y = 0, relative = true }), { repeating = true })
	hl.bind("h", hl.resize({ x = -15, y = 0, relative = true }), { repeating = true })
	hl.bind("k", hl.resize({ x = 0, y = 15, relative = true }), { repeating = true })
	hl.bind("j", hl.resize({ x = 0, y = -15, relative = true }), { repeating = true })

	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Session Management

hl.bind(mainMod .. " L", hl.dsp.exec_cmd(lock_screen), { description = "Lock screen" })
hl.bind("Control + Alt + Delete", hl.dsp.exec_cmd("wlogout -b 6"), { description = "Open logout menu" })

-- Desktop Environment

hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(bar), { description = "Toggle shell" })
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal), { description = "Terminal emulator" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(explorer), { description = "File explorer" })
hl.bind(mainMod .. " + Shift + E", hl.dsp.exec_cmd(altexplorer), { description = "Visual file explorer" })
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser), { description = "Web browser" })
hl.bind(mainMod .. " + Shift + B", hl.dsp.exec_cmd(altbrowser), { description = "Alternate web browser" })
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(editor), { description = "Text editor" })
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(screenshot), { description = "Screen capture selection" })
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(notification_panel), { description = "Toggle notifications panel" })

-- Launcher

hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(launcher .. " action"), { description = "Actions runner" })
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(launcher .. " app"), { description = "Application launcher" })
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(launcher .. " clipboard"), { description = "Clipboard history" })
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd(launcher .. " games"), { description = "Game launcher" })

-- Hardware controls

hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("$DOTFILES_BIN/swap_kb.sh " .. keyboard), { description = "Layout switch" })

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
	mainMod .. " + Shift + minus",
	hl.dsp.move({ workspace = "special" }),
	{ description = "Move to special workspace" }
)

-- Override

require("alt.binds")

-- bindd = $mainMod, P,      Toogle pseudo,         pseudo, # dwindle
-- bindd = $mainMod, Y, Pin current window (shows on all workspaces), pin,

-- bindd = $mainMod, G,          Toggle group,                    togglegroup
-- bindd = $mainMod Control, H,  Change active group backwards,   changegroupactive, b
-- bindd = $mainMod Control, L,  Change active group forwards,    changegroupactive, f

-- bindde = $mainMod Shift, Right,   Resize window right,   resizeactive, 30 0
-- bindde = $mainMod Shift, Left,    Resize window left,    resizeactive, -30 0
-- bindde = $mainMod Shift, Up,      Resize window up,      resizeactive, 0 -30
-- bindde = $mainMod Shift, Down,    Resize  window down,   resizeactive, 0 30

-- # Move/Resize focused window
-- binddm = $mainMod, mouse:272,   Hold to move window, movewindow
-- binddm = $mainMod, mouse:273,   Hold to resize window, resizewindow
-- binddm = $mainMod, Z,           Hold to move window, movewindow
-- binddm = $mainMod, X,           Hold to resize window, resizewindow

-- # bindd = $mainMod Shift, E, file finder , exec, pkill -x rofi || $rofi-launch f
-- # bindd = $mainMod, slash, keybindings hint, exec, pkill -x rofi || $scrPath/keybinds_hint.sh c # launch keybinds hint
-- # bindd = $mainMod, period, glyph picker , exec, pkill -x rofi || $scrPath/glyph-picker.sh # launch glyph picker
-- # bindd = $mainMod Shift, A, select rofi launcher , exec, pkill -x rofi || $scrPath/rofiselect.sh # launch select menu
-- # bindd = $mainMod, TAB,      Window switcher,    exec, pkill -x rofi || $launcher -show window
--
-- bindd = $mainMod Control, Down,       Navigate to the nearest empty workspace,   workspace, empty
--
-- bindd = $mainMod Alt, 1,              Move to workspace 1  (silent),   movetoworkspacesilent, 1
-- bindd = $mainMod Alt, 2,              Move to workspace 2  (silent),   movetoworkspacesilent, 2
-- bindd = $mainMod Alt, 3,              Move to workspace 3  (silent),   movetoworkspacesilent, 3
-- bindd = $mainMod Alt, 4,              Move to workspace 4  (silent),   movetoworkspacesilent, 4
-- bindd = $mainMod Alt, 5,              Move to workspace 5  (silent),   movetoworkspacesilent, 5
-- bindd = $mainMod Alt, 6,              Move to workspace 6  (silent),   movetoworkspacesilent, 6
-- bindd = $mainMod Alt, 7,              Move to workspace 7  (silent),   movetoworkspacesilent, 7
-- bindd = $mainMod Alt, 8,              Move to workspace 8  (silent),   movetoworkspacesilent, 8
-- bindd = $mainMod Alt, 9,              Move to workspace 9  (silent),   movetoworkspacesilent, 9
-- bindd = $mainMod Alt, 0,              Move to workspace 10 (silent),   movetoworkspacesilent, 10
--
-- # ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- # ┃                         Miscellanea                         ┃
-- # ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
--
-- # TODO: gamemode
-- # $d=[$ut]
-- # bindd = $mainMod Alt, G, game mode , exec, $scrPath/gamemode.sh # disable hypr effects for gamemode
-- # bindd = $mainMod Shift, G, open game launcher , exec, $scrPath/gamelauncher.sh # run game launcher for steam and lutris
--
-- # TODO:evaluate
-- # $d=[$ut|Screen Capture]
-- # bindd = $mainMod, P, snip screen , exec, $scrPath/screenshot.sh s # partial screenshot capture
-- # bindd = $mainMod Control, P, freeze and snip screen, exec, $scrPath/screenshot.sh sf # partial screenshot capture (frozen screen)
-- # win+shift+s?
