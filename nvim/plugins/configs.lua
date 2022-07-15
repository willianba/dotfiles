local M = {}

M.workspaces = function()
  local present, workspaces = pcall(require, "workspaces")

  if present then
    workspaces.setup({
      open = { "NVimTreeRefresh" },
    })
  end
end

M.git_gutter = function()
  vim.g.gitgutter_signs = 0
end

M.blamer = function()
  vim.g.blamer_enabled = 1
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

M.copilot = function()
  vim.g.copilot_node_command = "$HOME/.nvm/versions/node/v17.9.0/bin/node"
end

M.null_ls = function()
  local present, null_ls = pcall(require, "null-ls")

  if present then
    local sources = {
      --  js, ts
      null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.code_actions.eslint,
      null_ls.builtins.formatting.prettier,

      --- go
      null_ls.builtins.diagnostics.staticcheck,
      null_ls.builtins.formatting.gofmt,

      --- lua
      null_ls.builtins.diagnostics.luacheck,
      null_ls.builtins.formatting.stylua.with({
        extra_args = {
          "--indent-type=Spaces",
          "--indent-width=2",
          "--line-endings=Unix",
        },
      }),

      --- ruby
      null_ls.builtins.diagnostics.rubocop,
      null_ls.builtins.formatting.rubocop,
    }

    null_ls.setup({
      sources = sources,
    })
  end
end

return M
