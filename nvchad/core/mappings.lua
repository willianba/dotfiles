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
    ["<leader>tn"] = { "<cmd>TroubleToggle lsp_workspace_diagnostics<CR>", "trouble workspace diagnostics" },
    ["<leader>td"] = { "<cmd>TroubleToggle lsp_document_diagnostics<CR>", "trouble document diagnostics" },
    ["<leader>tq"] = { "<cmd>TroubleToggle quickfix<CR>", "trouble quickfix" },
    ["<leader>tf"] = { "<cmd>TroubleToggle lsp_references<CR>", "trouble references" },
    ["n"] = { "nzzzv", "search symbols and center screen" },
    ["N"] = { "Nzzzv", "search symbols and center screen backwards" },
    -- ["<C-d>"] = { "<C-d>zz", "go down and center screen" },
    -- ["<C-u>"] = { "<C-u>zz", "go up and center screen" },
  },
  i = {
    ["jk"] = { "<ESC>", "escape insert mode" },
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "move line down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "move line up" },
  },
  x = {
    ["<leader>p"] = { '"_dP', "paste over selection" },
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
