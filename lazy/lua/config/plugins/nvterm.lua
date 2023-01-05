return {
  "NvChad/nvterm",
  keys = {
    {
      "<A-i>",
      function()
        require("nvterm.terminal").toggle("float")
      end,
      mode = { "n", "t" },
    },
    {
      "<A-h>",
      function()
        vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true, true)
        require("nvterm.terminal").toggle("horizontal")
      end,
      mode = { "n", "t" },
    },
    {
      "<A-v>",
      function()
        vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true, true)
        require("nvterm.terminal").toggle("vertical")
      end,
      mode = { "n", "t" },
    },
  },
  config = function()
    require("nvterm").setup({
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
    })
  end,
}
