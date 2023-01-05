return {
  "natecraddock/workspaces.nvim",
  keys = {
    { "<leader>wa", "<cmd>WorkspacesAdd<cr>" },
    { "<leader>wr", "<cmd>WorkspacesRemove<cr>" },
    { "<leader>wl", "<cmd>WorkspacesList<cr>" },
    { "<leader>wo", "<cmd>WorkspacesOpen<cr>" },
  },
  config = function()
    require("workspaces").setup({
      hooks = {
        open = {
          "Telescope find_files",
        },
      },
    })
  end,
}
