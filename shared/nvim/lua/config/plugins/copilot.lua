return {
  enabled = false,
  "zbirenbaum/copilot.lua",
  enabled = false,
  event = "BufReadPost",
  config = function()
    require("copilot").setup({
      suggestion = {
        auto_trigger = true,
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
