return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
  dependencies = {
    { "HiPhish/rainbow-delimiters.nvim" },
    { "windwp/nvim-ts-autotag" },
    -- Disabled due to LspRequest event incompatibility with Neovim 0.9.5
    -- {
    --   "nvim-treesitter/nvim-treesitter-context",
    --   commit = "2bcf700b59bc92850ca83a1c02e86ba832e0fae0", -- Pin to specific working commit
    --   config = function()
    --     require("treesitter-context").setup({
    --       multiline_threshold = 1,
    --     })
    --   end,
    -- },
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash",
        "css",
        "gleam",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "rust",
        "typescript",
        "yaml",
        "vim",
      },
      autotag = {
        enable = true,
      },
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
