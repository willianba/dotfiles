hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

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
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },
	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({
	name = "zen-pip-float",
	match = {
		class = "zen",
		title = "Picture-in-Picture",
	},
	float = true,
	pin = true,
	size = "480 270",
	move = "100%-520 48",
})

hl.window_rule({
	name = "steam-friends-float",
	match = {
		class = "steam",
		title = "Lista de amigos",
	},
	float = true,
})

hl.window_rule({
	name = "taskbarhero",
	match = {
		class = "taskbarhero\\.exe",
		title = "TaskBarHero",
	},
	float = true,
})
