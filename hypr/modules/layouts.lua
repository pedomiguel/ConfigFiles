---@module 'hl'

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,
		border_size = 1,
		resize_on_border = true,
		layout = "master",
		allow_tearing = false,
		col = {
			active_border = { colors = { "rgba(00ff99ee)", "rgba(00ccffee)" }, angle = 45 },
			inactive_border = "rgba(313131aa)",
		},
	},

	decoration = {
		rounding = 5,
		active_opacity = 1.0,
		inactive_opacity = 0.85,
		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},
		blur = {
			enabled = true,
			size = 6,
			passes = 3,
			vibrancy = 0.1696,
			new_optimizations = true,
		},
	},

	cursor = {
		no_warps = true,
	},

	animations = {
		enabled = true,
	},

	master = {
		new_status = "slave",
		smart_resizing = false,
		mfact = 0.5,
	},

	misc = {
		mouse_move_focuses_monitor = false,
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
	},

	group = {
		groupbar = {
			font_size = 15,
			gradients = false,
			text_color = "rgba(ffffffff)",
			col = {
				active = "rgba(33ccffee)",
				inactive = "rgba(595959aa)",
			},
		},
	},
	dwindle = {
		preserve_split = true,
	},
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "slidefade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "slidefade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "slidefade" })

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})
