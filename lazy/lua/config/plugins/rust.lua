return {
  {
    "rust-lang/rust.vim",
    ft = { "rust" },
  },
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    dependencies = {
      {
        "neovim/nvim-lspconfig",
      },
      {
        "nvim-lua/plenary.nvim",
        optional = true,
      },
    },
    config = function()
      require("rust-tools").setup({
        server = {
          on_attach = function(client, buffer)
            -- require("config.plugins.lsp.format").on_attach(client, buffer)
            require("config.plugins.lsp.mappings").on_attach(client, buffer)
          end,
        },
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      })
    end,
  },
}
