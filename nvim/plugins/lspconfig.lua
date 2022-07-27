local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

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
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
