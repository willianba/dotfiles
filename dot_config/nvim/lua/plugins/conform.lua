vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable for the buffer only
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable format on save",
  bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Enable format on save",
})

-- Search upward from the buffer's own directory (not the cwd) for a config file.
-- `ctx.dirname` is provided by conform; fall back to the cwd when absent.
local function has_config_upward(names)
  return function(_, ctx)
    local from = ctx and ctx.dirname or vim.fn.getcwd()
    return vim.fs.find(names, { upward = true, path = from, stop = vim.env.HOME })[1] ~= nil
  end
end

local biome_config = { "biome.json", "biome.jsonc" }

local prettier_config = {
  ".prettierrc",
  ".prettierrc.json",
  ".prettierrc.json5",
  ".prettierrc.yml",
  ".prettierrc.yaml",
  ".prettierrc.toml",
  ".prettierrc.js",
  ".prettierrc.cjs",
  ".prettierrc.mjs",
  "prettier.config.js",
  "prettier.config.cjs",
  "prettier.config.mjs",
  "prettier.config.ts",
}

local formatters = { "biome_check", "prettierd", stop_after_first = true }

return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  keys = {
    {
      "<leader>fm",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
    },
  },
  opts = {
    format_on_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 500, lsp_format = "fallback" }
    end,
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = formatters,
      typescript = formatters,
      javascriptreact = formatters,
      typescriptreact = formatters,
      json = formatters,
      jsonc = formatters,
      svelte = { "prettierd" },
      rust = { "rustfmt" },
      terraform = { "terraform_fmt" },
      go = { "gofumpt", "gofmt" },
    },
    formatters = {
      biome_check = {
        command = "bunx",
        args = { "biome", "check", "--write", "--stdin-file-path", "$FILENAME" },
        condition = has_config_upward(biome_config),
      },
      prettierd = {
        -- Without a project config prettierd would impose its own defaults
        -- (2 spaces), so only run it where the project actually configures it.
        condition = has_config_upward(prettier_config),
      },
      stylua = {
        extra_args = {
          "--indent-type=Spaces",
          "--indent-width=2",
          "--line-endings=Unix",
        },
      },
    },
  },
}
