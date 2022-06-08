-- this file tracks plugins configs to override/add
--
local M = {}

M.nvimtree = {
  git = {
    enable = true
  },
  renderer = {
    highlight_git = true,
    icons = {
       show = {
        git = true,
      }
    }
  },
  filters = {
    dotfiles = false,
  },
  view = {
    width = 30,
  },
  diagnostics = {
    enable = false,
    show_on_dirs = true,
  }
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
    "java",
    "ruby",
    "go",
    "graphql",
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil -- Do not enable for files with more than n lines, int
  },
  autotag = {
    enable = true
  }
}

M.telescope = {
  extensions_list = { "themes", "terms", "workspaces" }
}

return M
