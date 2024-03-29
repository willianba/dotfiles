local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

local servers = {
  "astro",
  "bashls",
  "eslint",
  "gopls",
  "graphql",
  "html",
  "jsonls",
  "marksman",
  "prismals",
  "rust_analyzer",
  "sumneko_lua",
  "tailwindcss",
  "terraformls",
  "tsserver",
  "yamlls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
