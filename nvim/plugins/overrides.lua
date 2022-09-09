local M = {}

M.nvimtree = {
  git = {
    enable = true,
    ignore = false,
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
    "astro",
    "bash",
    "css",
    "go",
    "graphql",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "prisma",
    "typescript",
    "vim",
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

M.cmp = {
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
}

M.mason = {
  ensure_installed = {
    "astro-language-server",
    "bash-language-server",
    "eslint-lsp",
    "gopls",
    "graphql-language-service-cli",
    "html-lsp",
    "json-lsp",
    "marksman",
    "lua-language-server",
    "prisma-language-server",
    "tailwindcss-language-server",
    "typescript-language-server",
    "yaml-language-server",
    "firefox-debug-adapter",
    "go-debug-adapter",
    "markdownlint",
    "prettier",
    "stylua",
  },
}

return M
