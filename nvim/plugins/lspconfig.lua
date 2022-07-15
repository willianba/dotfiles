local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require("lspconfig")

  local servers = {
    "gopls",
    "graphql",
    "html",
    "eslint",
    "jsonls",
    "sumneko_lua",
    "zk",
    "solargraph",
    "tsserver",
    "astro",
    "prismals",
  }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
      on_attach = attach,
      capabilities = capabilities,
    })
  end
end

return M
