local util = require("config.settings.util")

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

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>fm",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
    },
  },
  opts = {
    format_on_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 500, lsp_fallback = true }
    end,
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
      astro = { { "prettierd", "prettier" } },
      rust = { "rustfmt" },
      terraform = { "terraform_fmt" },
    },
    formatters = {
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
