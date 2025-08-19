return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.*",
  opts = {
    keymap = {
      preset = "enter",
      ["<C-space>"] = {},
    },
    completion = {
      list = {
        selection = {
          preselect = false,
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 250,
      },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "normal",
    },
    sources = {
      default = { "lsp", "snippets", "buffer", "path" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
