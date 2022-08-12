local M = {}

M.disabled = {
  n = {
    ["<leader>n"] = "",
    ["<leader>rn"] = "",
    ["<leader>wa"] = "",
    ["<leader>wr"] = "",
    ["<leader>wl"] = "",
  },
}

M.general = {
  n = {
    ["<leader>tr"] = { "<cmd>TroubleToggle<CR>", "trouble diagnostics" },
  },
  i = {
    ["jk"] = { "<ESC>", "escape insert mode" },
  },
}

M.workspaces = {
  n = {
    ["<leader>wa"] = { "<Cmd>WorkspacesAdd<CR>", "add workspace folder" },
    ["<leader>wr"] = { "<Cmd>WorkspacesRemove<CR>", "remove workspace folder" },
    ["<leader>wl"] = { "<Cmd>WorkspacesList<CR>", "list workspace folders" },
    ["<leader>wo"] = { "<Cmd>WorkspacesOpen<CR>", "open workspace folder" },
    ["<leader>tw"] = { "<Cmd>Telescope workspaces<CR>", "open workspaces picker" },
  },
}

M.zen = {
  n = {
    ["<leader>zm"] = { "<cmd>ZenMode<CR>", "toggle zen mode" },
  },
}

return M
