---@module 'hl'

-- Bind workspaces 1-5 to DP-1

hl.workspace_rule({
	workspace = 1,
	monitor = _G.mainMonitor,
	persistent = true,
})

hl.workspace_rule({
	workspace = 2,
	monitor = _G.mainMonitor,
	persistent = true,
})

hl.workspace_rule({
	workspace = 3,
	monitor = _G.mainMonitor,
	persistent = true,
})

hl.workspace_rule({
	workspace = 4,
	monitor = _G.mainMonitor,
	persistent = true,
})

hl.workspace_rule({
	workspace = 5,
	monitor = _G.mainMonitor,
	persistent = true,
})

-- Bind workspaces 6-10 to HDMI-A-1

hl.workspace_rule({
	workspace = 6,
	monitor = _G.secondaryMonitor,
	persistent = false,
})

hl.workspace_rule({
	workspace = 7,
	monitor = _G.secondaryMonitor,
	persistent = false,
})

hl.workspace_rule({
	workspace = 8,
	monitor = _G.secondaryMonitor,
	persistent = false,
})

hl.workspace_rule({
	workspace = 9,
	monitor = _G.secondaryMonitor,
	persistent = false,
})

hl.workspace_rule({
	workspace = 10,
	monitor = _G.secondaryMonitor,
	persistent = false,
})

-- See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

-- See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

-- Core behavior

hl.window_rule({
	name = "suppressevent_maximi",
	match = {
		class = ".*",
	},
	suppress_event = "maximize",
})

-- Optional XWayland fix (only if needed)

hl.window_rule({
	name = "nofocus",
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

-- Dialogs

hl.window_rule({
	name = "float_dialogs",
	match = {
		title = "^(Open|Save|Save As|Choose File|File Upload)$",
	},
	float = true,
	center = true,
})

hl.window_rule({
	name = "float_portal",
	match = {
		class = "^(xdg-desktop-portal-gtk)$",
	},
	float = true,
	size = "800 600",
	center = true,
})

-- System apps

hl.window_rule({
	name = "float_system",
	match = {
		class = "^(pavucontrol|blueman-manager|nm-connection-editor|atril)$",
	},
	float = true,
	size = "800 600",
})

hl.window_rule({
	name = "center_sytem",
	match = {
		class = "^(pavucontrol|blueman-manager|nm-connection-editor)$",
	},
	center = true,
})

hl.layer_rule({
	match = {
		namespace = "hyprlauncher",
	},
	blur = true,
	animation = "popin",
})
