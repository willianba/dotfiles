local M = {}

M.disabled = {
  n = {
    "<C-n>",
    "<C-b>",
    "<leader>n",
    "<leader>rn",
    "<leader>wa",
    "<leader>wr",
    "<leader>wl",
  },
}

M.general = {
  n = {
    ["<leader>tr"] = { "<cmd>TroubleToggle<CR>", "   trouble diagnostics" },
    ["<leader>cw"] = { "<cmd>CursorWordToggle<CR>", "  toggle cursor word" },
  },
  i = {
    ["jk"] = { "<ESC>", "  escape insert mode" },
  },
}

M.workspaces = {
  n = {
    ["<leader>wa"] = { "<Cmd>WorkspacesAdd<CR>", "   add workspace folder" },
    ["<leader>wr"] = { "<Cmd>WorkspacesRemove<CR>", "  remove workspace folder" },
    ["<leader>wl"] = { "<Cmd>WorkspacesList<CR>", "   list workspace folders" },
    ["<leader>wo"] = { "<Cmd>WorkspacesOpen<CR>", "  open workspace folder" },
    ["<leader>tw"] = { "<Cmd>Telescope workspaces<CR>", "  open workspaces picker" },
  },
}

M.nvimtree = {
  n = {
    ["<C-b>"] = { "<cmd>NvimTreeToggle<CR>", "   toggle nvimtree" },
  },
}

return M
