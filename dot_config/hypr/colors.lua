local theme = {
	primary = "rgba(156, 65, 59, 1.0)",
	secondary = "rgba(119, 86, 83, 1.0)",
	error = "rgba(186, 26, 26, 1.0)",
	tertiary = "rgba(114, 91, 46, 1.0)",
	surface = "rgba(255, 248, 247, 1.0)",
	surface_lowest = "rgba(255, 255, 255, 1.0)",
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
