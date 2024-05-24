return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
  dependencies = {
    { "p00f/nvim-ts-rainbow" },
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
        "help",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "rust",
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
