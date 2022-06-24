local function termcodes(str)
   return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local M = {}

M.disabled = {
  n = {
    "<C-n>",
    "<C-b>",
    "<leader>n",
    "<leader>rn",
    "<leader>wa",
    "<leader>wr",
    "<leader>wl"
  }
}

M.general = {
  t = {
    ["jk"] = { termcodes "<C-\\><C-N>", "   escape terminal mode" },
  },
  n = {
    ["<leader>tr"] = {"<cmd>TroubleToggle<CR>", "   trouble diagnostics"},
    ["<leader>gd"] = {"<cmd>GitGutterDiffOrig<CR>", "  activate git diff"},
    ["<leader>gf"] = {"<cmd>GitGutterFold<CR>", "  toggle changes fold"}
  },
  i = {
    ["jk"] = { "<ESC>", "  escape insert mode" },
  }
}

M.comment = {
  n = {
    ["gcc"] = {
      "<ESC><cmd>lua require('Comment.api').toggle_current_linewise()<CR>",
      "Toggle line comment"
    }
  },
  v = {
    ["gcc"] = {
      "<ESC><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>",
      "Toggle line comment"
    }
  }
}

M.workspaces = {
  n = {
    ["<leader>wa"] = { "<Cmd>WorkspacesAdd<CR>", "   add workspace folder" },
    ["<leader>wr"] = {"<Cmd>WorkspacesRemove<CR>", "  remove workspace folder" },
    ["<leader>wl"] = { "<Cmd>WorkspacesList<CR>", "   list workspace folders" },
    ["<leader>wo"] = { "<Cmd>WorkspacesOpen<CR>", "  open workspace folder" },
    ["<leader>tw"] = { "<Cmd>Telescope workspaces<CR>", "  open workspaces picker" }
  }
}

M.nvimtree = {
  n = {
    ["<C-b>"] = { "<cmd>NvimTreeToggle<CR>", "   toggle nvimtree" },
  }
}

return M
