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
  "ts_ls",
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

local util = require("lspconfig.util")

return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    {
      "williamboman/mason.nvim",
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
            print(string.format("[mason] installing %s", package.name))
            package:install()
            print(string.format("[mason] %s installed", package.name))
          end
        end
      end,
    },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        automatic_installation = true,
        ensure_installed = servers,
      },
    },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local buffer = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        require("config.plugins.lsp.mappings").on_attach(client, buffer)
      end,
    })

    for name, icon in pairs(require("config.settings.icons").diagnostics) do
      name = "DiagnosticSign" .. name
      vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
    end
    vim.diagnostic.config({
      underline = true,
      update_in_insert = false,
      virtual_text = { spacing = 2, prefix = "●" },
      severity_sort = true,
    })

    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = "single"
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    for _, server in pairs(servers) do
      -- Skip ts_ls and denols here as they have specific setup below
      if server ~= "ts_ls" and server ~= "denols" then
        require("lspconfig")[server].setup({ capabilities })
      end
    end

    -- specific setup for some servers
    -- TypeScript Language Server - only for non-Deno projects
    require("lspconfig")["ts_ls"].setup({
      capabilities = capabilities,
      root_dir = util.root_pattern("tsconfig.json", "jsconfig.json", "package.json"),
      single_file_support = false, -- Disable single file support to prevent conflicts
    })
    
    -- Deno Language Server - only for Deno projects
    require("lspconfig")["denols"].setup({
      capabilities = capabilities,
      root_dir = util.root_pattern("deno.json", "deno.jsonc"),
      single_file_support = false, -- Disable single file support to prevent conflicts
      settings = {
        deno = {
          enable = true,
          lint = true,
          unstable = true,
        },
      },
    })
  end,
}
