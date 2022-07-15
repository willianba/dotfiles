-- this file tracks new and replaced plugins
local configs = require("custom.plugins.configs")

return {
	["goolord/alpha-nvim"] = {
		disable = false,
	},
	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = configs.null_ls,
	},
	["natecraddock/workspaces.nvim"] = {
		after = "nvim-treesitter",
		config = configs.workspaces,
	},
	["airblade/vim-gitgutter"] = {
		config = configs.git_gutter,
	},
	["APZelos/blamer.nvim"] = {
		config = configs.blamer,
	},
	["folke/trouble.nvim"] = {
		config = configs.trouble,
	},
	["nvim-treesitter/nvim-treesitter-context"] = {
		after = "nvim-treesitter",
		config = configs.ts_context,
	},
	-- ["tpope/vim-endwise"] = {}, -- not working https://github.com/nvim-treesitter/nvim-treesitter/issues/703
	["tpope/vim-surround"] = {},
	["github/copilot.vim"] = {
		config = configs.copilot,
	},
	["p00f/nvim-ts-rainbow"] = {
		after = "nvim-treesitter",
	},
	["windwp/nvim-ts-autotag"] = {
		after = "nvim-treesitter",
	},
	["karb94/neoscroll.nvim"] = {
		config = configs.neoscroll,
	},
	["mg979/vim-visual-multi"] = {
		branch = "master",
	},
}
