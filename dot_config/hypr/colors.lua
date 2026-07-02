local theme = {
	primary = "rgba(237, 193, 72, 1.0)",
	secondary = "rgba(214, 197, 160, 1.0)",
	error = "rgba(255, 180, 171, 1.0)",
	tertiary = "rgba(174, 207, 172, 1.0)",
	surface = "rgba(21, 19, 14, 1.0)",
	surface_lowest = "rgba(16, 14, 9, 1.0)",
}

hl.config({
	general = {
		col = {
			active_border = theme.primary,
			inactive_border = theme.surface,
		},
	},

	group = {
		col = {
			border_active = theme.secondary,
			border_inactive = theme.surface,
			border_locked_active = theme.error,
			border_locked_inactive = theme.surface,
		},

		groupbar = {
			col = {
				active = theme.secondary,
				inactive = theme.surface,
				locked_active = theme.error,
				locked_inactive = theme.surface,
			},
		},
	},
})
