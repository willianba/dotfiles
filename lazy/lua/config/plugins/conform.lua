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
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
      astro = { { "prettierd", "prettier" } },
      rust = { "rustfmt" },
      terraform = { "terraform_fmt" },
    },
    format_on_save = { timeout_ms = 500, lsp_fallback = true },
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
