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
      javascript = { "biome_check" },
      typescript = { "biome_check" },
      javascriptreact = { "biome_check" },
      typescriptreact = { "biome_check" },
      svelte = { "prettierd" },
      rust = { "rustfmt" },
      terraform = { "terraform_fmt" },
      go = { "gofumpt", "gofmt" },
    },
    formatters = {
      biome_check = {
        command = "bunx",
        args = { "biome", "check", "--write", "--stdin-file-path", "$FILENAME" },
        condition = function()
          return vim.fs.find({ "biome.json", "biome.jsonc" }, { upward = true, stop = vim.env.HOME })[1] ~= nil
        end,
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
