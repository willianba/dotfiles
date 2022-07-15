-- this file tracks plugins configs to override/add
--
local M = {}

M.nvimtree = {
	git = {
		enable = true,
	},
	view = {
		adaptive_size = true,
		width = 35,
	},
	renderer = {
		group_empty = true,
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
	filters = {
		dotfiles = false,
	},
	diagnostics = {
		enable = false,
		show_on_dirs = true,
	},
}

M.treesitter = {
	ensure_installed = {
		"lua",
		"vim",
		"typescript",
		"javascript",
		"json",
		"markdown",
		"bash",
		"html",
		"css",
		"ruby",
		"go",
		"graphql",
		"prisma",
	},
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
	},
	autotag = {
		enable = true,
	},
}

M.telescope = {
	extensions_list = { "themes", "terms", "workspaces" },
}

M.nvterm = {
	terminals = {
		type_opts = {
			float = {
				relative = "editor",
				row = 0.1,
				col = 0.1,
				width = 0.8,
				height = 0.8,
				border = "single",
			},
		},
	},
}

return M
