return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  dependencies = {
    { "HiPhish/rainbow-delimiters.nvim" },
    { "windwp/nvim-ts-autotag" },
    {
      "nvim-treesitter/nvim-treesitter-context",
      config = function()
        require("treesitter-context").setup({
          multiline_threshold = 1,
        })
      end,
    },
  },
  config = function()
    local ensureInstalled = {
      "bash",
      "css",
      "go",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "rust",
      "sql",
      "svelte",
      "typescript",
      "yaml",
      "vim",
    }
    local alreadyInstalled = require("nvim-treesitter.config").get_installed()
    local parsersToInstall = vim
      .iter(ensureInstalled)
      :filter(function(parser)
        return not vim.tbl_contains(alreadyInstalled, parser)
      end)
      :totable()
    require("nvim-treesitter").install(parsersToInstall)
  end,
}
