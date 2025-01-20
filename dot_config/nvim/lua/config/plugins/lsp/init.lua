local servers = {
  "bashls",
  "cssls",
  "denols",
  "eslint",
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
  "luacheck",
  "markdownlint",
  "prettier",
  "stylua",
}

local no_conflict = function(client)
  local active_clients = vim.lsp.get_active_clients()
  if client.name == "denols" then
    for _, client_ in pairs(active_clients) do
      -- stop ts_ls if denols is already active
      if client_.name == "ts_ls" then
        client_.stop()
      end
    end
  elseif client.name == "ts_ls" then
    for _, client_ in pairs(active_clients) do
      -- prevent ts_ls from starting if denols is already active
      if client_.name == "denols" then
        client.stop()
      end
    end
  end
end

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

    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
    for _, server in pairs(servers) do
      require("lspconfig")[server].setup({ capabilities })
    end

    -- specific setup for some servers
    require("lspconfig")["ts_ls"].setup({
      capabilities,
      on_attach = no_conflict,
      root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json"),
    })
    require("lspconfig")["denols"].setup({
      capabilities,
      on_attach = no_conflict,
      root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
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
