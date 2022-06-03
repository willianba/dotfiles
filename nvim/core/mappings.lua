local function termcodes(str)
   return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local M = {}

M.disabled = {
  n = {
    ["<leader>n"] = { "<cmd> set nu! <CR>", "   toggle line number" },
    ["<leader>rn"] = { "<cmd> set rnu! <CR>", "   toggle relative number" },
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },
  }
}

M.general = {
  t = {
    ["jk"] = { termcodes "<C-\\><C-N>", "   escape terminal mode" },
  }
}

M.comment = {
  n = {
    ["gcc"] = {
      function()
        require("Comment.api").toggle_current_linewise()
      end,
      "蘒  toggle comment",
    }
  },
  v = {
      ["gcc"] = {
        "<ESC><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>",
        "蘒  toggle comment",
      },
  }
}

M.nvimtree = {
  n = {
    ["<C-b>"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },
  }
}

M.telescope = {
  n = {
    ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "   show keys" },
  }
}

return M
