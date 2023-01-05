local M = {}

M.workspaces = function()
  local present, workspaces = pcall(require, "workspaces")

  if present then
    workspaces.setup({
      open = { "NVimTreeRefresh" },
    })
  end
end

M.trouble = function()
  local present, trouble = pcall(require, "trouble.nvim")

  if present then
    trouble.setup({})
  end
end

M.ts_context = function()
  local present, ts_context = pcall(require, "treesitter-context")

  if present then
    ts_context.setup({})
  end
end

M.neoscroll = function()
  local present, neoscroll = pcall(require, "neoscroll")

  if present then
    neoscroll.setup({})
  end
end

M.surround = function()
  local present, surround = pcall(require, "nvim-surround")

  if present then
    surround.setup({})
  end
end

M.copilot = function()
  local present, copilot = pcall(require, "copilot")

  if present then
    copilot.setup({
      suggestion = {
        auto_trigger = true,
      },
      copilot_node_command = vim.fn.expand("$HOME") .. "/.nvm/versions/node/v17.9.0/bin/node",
      server_opts_overrides = {
        settings = {
          advanced = {
            listCount = 5,
            inlineSuggestCount = 3,
          },
        },
      },
    })
  end
end

M.copilot_cmp = function()
  local present, copilot_cmp = pcall(require, "copilot_cmp")

  if present then
    copilot_cmp.setup({})
  end
end

M.null_ls = function()
  local present, null_ls = pcall(require, "null-ls")

  if present then
    local sources = {
      --  js, ts
      null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.code_actions.eslint,
      null_ls.builtins.formatting.prettier.with({
        extra_filetypes = { "astro" },
      }),
      null_ls.builtins.formatting.prismaFmt,

      --- go
      null_ls.builtins.diagnostics.staticcheck,
      null_ls.builtins.formatting.gofmt,

      -- rust
      null_ls.builtins.formatting.rustfmt,

      --- terraform
      null_ls.builtins.formatting.terraform_fmt,

      --- lua
      null_ls.builtins.diagnostics.luacheck,
      null_ls.builtins.formatting.stylua.with({
        extra_args = {
          "--indent-type=Spaces",
          "--indent-width=2",
          "--line-endings=Unix",
        },
      }),
    }

    null_ls.setup({
      sources = sources,
    })
  end
end

M.lspconfig = function()
  require("plugins.configs.lspconfig")
  require("custom.plugins.lspconfig")
end

M.mason_lspconfig = function()
  local present, mason_lspconfig = pcall(require, "mason-lspconfig.nvim")

  if present then
    mason_lspconfig.setup({
      ensure_installed = {
        "astro-language-server",
        "bash-language-server",
        "eslint-lsp",
        "gopls",
        "graphql-language-service-cli",
        "html-lsp",
        "json-lsp",
        "marksman",
        "lua-language-server",
        "prisma-language-server",
        "rust-analyzer",
        "tailwindcss-language-server",
        "terraform-ls",
        "typescript-language-server",
        "yaml-language-server",
        "firefox-debug-adapter",
        "go-debug-adapter",
        "markdownlint",
        "prettier",
        "stylua",
      },
    })
  end
end

M.zen = function()
  local present, zen = pcall(require, "zen-mode")

  if present then
    zen.setup({
      window = {
        backdrop = 1,
      },
    })
  end
end

M.scrollbar = function()
  local present, scrollbar = pcall(require, "scrollbar")

  if present then
    scrollbar.setup({})
    require("scrollbar.handlers.gitsigns").setup()
  end
end

M.vim_astro = function()
  vim.g.astro_typescript = "enable"
end

return M
