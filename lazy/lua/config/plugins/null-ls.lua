local M = {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPost",
  enabled = false,
}

M.config = function()
  local null = require("null-ls")
  null.setup({
    sources = {
      --  js, ts
      null.builtins.diagnostics.eslint_d,
      null.builtins.code_actions.eslint_d,
      null.builtins.formatting.prettierd.with({
        extra_filetypes = { "astro" },
      }),

      -- rust
      null.builtins.formatting.rustfmt,

      --- terraform
      null.builtins.formatting.terraform_fmt,

      --- lua
      null.builtins.diagnostics.luacheck,
      null.builtins.formatting.stylua.with({
        extra_args = {
          "--indent-type=Spaces",
          "--indent-width=2",
          "--line-endings=Unix",
        },
      }),
    },
  })
end

return M
