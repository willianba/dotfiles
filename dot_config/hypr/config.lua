hl.config({
	xwayland = {
		force_zero_scaling = true,
	},

	ecosystem = {
		no_update_news = true,
	},

	general = {
		gaps_in = 5,
		gaps_out = 5,
		border_size = 2,
		resize_on_border = true,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 0.9,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 2,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},

	dwindle = {
		preserve_split = true,
	},

	scrolling = {
		fullscreen_on_one_column = true,
		column_width = 0.97,
	},

	misc = {
		mouse_move_enables_dpms = false,
		disable_hyprland_logo = true,
		focus_on_activate = true,
	},

	input = {
		kb_layout = "us",
		kb_variant = "intl",
		repeat_rate = 40,
		repeat_delay = 500,
		follow_mouse = 1,
		sensitivity = -0.4,
	},
})
