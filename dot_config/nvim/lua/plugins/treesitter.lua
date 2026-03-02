return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
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
