return {
  enabled = true,
  "zbirenbaum/copilot.lua",
  event = "BufReadPost",
  config = function()
    require("copilot").setup({
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<M-m>",
          next = "<M-.>",
          prev = "<M-,>",
        },
      },
      copilot_node_command = vim.fn.expand("$HOME") .. "/.local/share/mise/installs/node/20/bin/node",
      server_opts_overrides = {
        settings = {
          advanced = {
            listCount = 5,
            inlineSuggestCount = 3,
          },
        },
      },
    })
  end,
}
