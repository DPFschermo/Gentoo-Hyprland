--------------------
---   COLORS     ---
--------------------

dofile("/home/fraggi/.cache/wal/colors-hyprland.lua")

--------------------
---   MONITORS   ---
--------------------

hl.monitor({
	output = "eDP-1",
	mode = "1920x1080@60",
	position = "0x0",
	scale = 1,
})

hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@60",
	position = "0x0",
	scale = 1,
	mirror = "eDP-1",
})

-------------------
--- My Programs ---
-------------------
local terminal = "foot"
local fileManager = "Thunar"
local menu = "wofi --show drun"

-------------------
---  AUTOSTART  ---
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland")
	hl.exec_cmd("sleep 1 && /usr/libexec/xdg-desktop-portal-hyprland &")
	hl.exec_cmd("pipewire &")
	hl.exec_cmd("pipewire-pulse &")
	hl.exec_cmd("wireplumber &")
	hl.exec_cmd("swww-daemon & sleep 1 && wal -R")
	hl.exec_cmd("sed -i 's/alpha=ff/alpha=1.0/g' " .. os.getenv("HOME") .. "/.cache/wal/colors-foot.ini")
	hl.exec_cmd("waybar")
	hl.exec_cmd("mako")
	hl.exec_cmd("fish ~/.config/hypr/scripts/battery_check.fish")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-modules ''")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 16")
end)

-----------------------------
---  ENVIRONMENT VARIABLES ---
-----------------------------

hl.env("XCURSOR_SIZE", "16")
hl.env("HYPRCURSOR_SIZE", "16")
hl.env("XCURSOR_THEME", "Adwaita")

hl.config({
	cursor = {
		no_hardware_cursors = true,
	},
})

-------------------
--- Permissions ---
-------------------

-----------------------
---  LOOK AND FEEL  ---
-----------------------

hl.config({
	general = {
		gaps_in = 15,
		gaps_out = 20,
		border_size = 1,
		col = {
			active_border = { colors = { color4, color1 }, angle = 45 },
			inactive_border = background,
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	master = {
		smart_resizing = true,
		orientation = "left",
		new_on_top = false,
	},

	dwindle = {
		smart_split = false,
		smart_resizing = true,
	},

	decoration = {
		rounding = 0,
		rounding_power = 2,
		active_opacity = 0.85,
		inactive_opacity = 0.75,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 5,
			passes = 3,
			vibrancy = 2,
		},
	},
})

--------------------
---  ANIMATIONS  ---
--------------------

hl.config({
	animations = { enabled = true },
})

-- Bezier curves
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("snap", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.1 } } })
hl.curve("smoothOut", { type = "bezier", points = { { 0.36, 0 }, { 0.66, -0.56 } } })
hl.curve("smoothIn", { type = "bezier", points = { { 0.25, 1 }, { 0.5, 1 } } })
hl.curve("workspaceBezier", { type = "bezier", points = { { 0.3, 1 }, { 0.2, 1 } } })

-- Animations
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "snap", style = "slide" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "snap", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "snap", style = "slide" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 4, bezier = "default", style = "slide" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })

----------------
---   MISC   ---
----------------

hl.config({
	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo = true,
	},
})

-----------------
---   INPUT   ---
-----------------

hl.config({
	input = {
		kb_layout = "it,us",
		kb_variant = "",
		kb_model = "",
		kb_options = "grp:alt_shift_toggle,caps:escape,scrolllock:mod3",
		kb_rules = "",

		follow_mouse = 1,
		sensitivity = 0,

		touchpad = {
			natural_scroll = true,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

---------------------
---  KEYBINDINGS  ---
---------------------

local mainMod = "SUPER"

-- Apps & actions
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(
	mainMod .. " + D",
	hl.dsp.exec_cmd("wofi --show drun --conf ~/.config/wofi/config --style ~/.config/wofi/style.css")
)
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("~/.config/hypr/scripts/monitor_mode.sh"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("~/.config/waybar/scripts/wall-change.fish"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

-- Move focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch & move to workspaces
for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Screenshots
hl.bind(
	"Print",
	hl.dsp.exec_cmd(
		"grim -g \"$(slurp)\" - | tee ~/Pictures/Screenshots/$(date +'%Y-%m-%d-%H%M%S_screenshot.png') | wl-copy"
	)
)
hl.bind("SHIFT + Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))
hl.bind("CTRL + Print", hl.dsp.exec_cmd("grim ~/Pictures/Screenshots/$(date +'%Y-%m-%d-%H%M%S_full.png')"))

-- Special workspace
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume & brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Media keys
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--------------------------------
---  WINDOWS AND WORKSPACES  ---
--------------------------------

-- wofi window rules
hl.window_rule({
	name = "wofi-opacity",
	match = { class = "^(wofi)$" },
	opacity = "0.8 override",
})

hl.window_rule({
	name = "wofi-focus",
	match = { class = "^(wofi)$" },
	stay_focused = true,
})

-- wofi layer rules
hl.layer_rule({
	name = "wofi-blur",
	match = { namespace = "^(wofi)$" },
	blur = true,
})

hl.layer_rule({
	name = "wofi-ignore-alpha",
	match = { namespace = "^(wofi)$" },
	ignore_alpha = 0.5,
})
