local M = {
  "L3MON4D3/LuaSnip",
  event = "BufReadPost",
  dependencies = { "rafamadriz/friendly-snippets" },
}

M.config = function()
  local luasnip = require("luasnip")
  luasnip.config.setup({
    history = true,
    enable_autosnippets = true,
    updateevents = "TextChanged,TextChangedI",
  })

  luasnip.filetype_extend("typescriptreact", { "html" })
  luasnip.filetype_extend("javascriptreact", { "html" })
  luasnip.filetype_extend("astro", { "html" })

  require("luasnip.loaders.from_vscode").lazy_load()

  vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
      local luasnip = require("luasnip")
      if luasnip.session.current_nodes[vim.api.nvim_get_current_buf()] and not luasnip.session.jump_active then
        luasnip.unlink_current()
      end
    end,
  })
end

return M
