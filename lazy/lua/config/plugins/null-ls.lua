local M = {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPost",
}

M.config = function()
  local null = require("null-ls")
  null.setup({
    sources = {
      --  js, ts
      null.builtins.diagnostics.eslint,
      null.builtins.code_actions.eslint,
      null.builtins.formatting.prettier.with({
        extra_filetypes = { "astro" },
      }),
      null.builtins.formatting.prismaFmt,

      --- go
      null.builtins.diagnostics.staticcheck,
      null.builtins.formatting.gofmt,

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
