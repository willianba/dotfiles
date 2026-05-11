return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "BufReadPre",
  config = function()
    require("ibl").setup({
      exclude = {
        filetypes = {
          "help",
          "terminal",
          "alpha",
          "packer",
          "lspinfo",
          "TelescopePrompt",
          "TelescopeResults",
          "mason",
          "",
        },
        buftypes = { "terminal", "nofile" },
      },
      indent = {
        char = "│",
      },
      scope = {
        show_end = false,
        show_exact_scope = true,
        show_start = true,
      },
    })
  end,
}
