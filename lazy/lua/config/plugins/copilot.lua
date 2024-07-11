return {
  "zbirenbaum/copilot.lua",
  event = "BufReadPost",
  config = function()
    require("copilot").setup({
      suggestion = {
        auto_trigger = true,
      },
      copilot_node_command = vim.fn.expand("$HOME") .. "/.local/share/nvm/v20.15.0/bin/node",
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
