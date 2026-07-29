hl.config({
	input = {
		kb_layout = "br",
		kb_variant = "abnt2",
		kb_options = "",
		kb_model = "",
		kb_rules = "",
		repeat_delay = 200,
		repeat_rate = 50,
		follow_mouse = 2,
		float_switch_override_focus = 0,
		sensitivity = 0,
		touchpad = {
			natural_scroll = true,
			disable_while_typing = true,
		},
	},
})

hl.monitor({
	output = _G.mainMonitor,
	mode = "1920x1080@60.00",
	position = "0x0",
	scale = 1,
})

hl.monitor({
	output = _G.secondaryMonitor,
	mode = "preferred",
	position = "auto-center-up",
	scale = 1,
})
