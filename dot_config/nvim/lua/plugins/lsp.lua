local servers = {
  "bashls",
  "cssls",
  "denols",
  "gopls",
  "html",
  "jsonls",
  "lua_ls",
  "marksman",
  "rust_analyzer",
  "terraformls",
  "vtsls",
  "yamlls",
}

local tools = {
  "eslint_d",
  "gofumpt",
  "goimports",
  "luacheck",
  "markdownlint",
  "prettierd",
  "stylua",
}

return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = servers,
  },
  dependencies = {
    {
      "mason-org/mason.nvim",
      cmd = { "Mason" },
      config = function()
        require("mason").setup({
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        })
        local registry = require("mason-registry")
        for _, tool in pairs(tools) do
          local package = registry.get_package(tool)
          if not package:is_installed() then
            package:install()
          end
        end
      end,
    },
    {
      "neovim/nvim-lspconfig",
      config = function()
        vim.lsp.config("denols", {
          root_markers = { "deno.json", "deno.jsonc" },
          workspace_required = true,
        })

        vim.lsp.config("vtsls", {
          workspace_required = true,
        })
      end,
    },
  },
}
