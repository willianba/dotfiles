return {
  "kyazdani42/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<C-n>", "<cmd>NvimTreeToggle<cr>" },
    { "<leader>e", "<cmd>NvimTreeFocus<cr>" },
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      filters = {
        dotfiles = false,
      },
      disable_netrw = true,
      hijack_netrw = true,
      open_on_setup = false,
      ignore_ft_on_setup = { "alpha" },
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = false,
      sync_root_with_cwd = true,
      reload_on_bufenter = true,
      update_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      view = {
        adaptive_size = true,
        side = "left",
        width = 35,
        hide_root_folder = true,
      },
      git = {
        enable = true,
        ignore = false,
      },
      filesystem_watchers = {
        enable = true,
      },
      actions = {
        open_file = {
          resize_window = true,
        },
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
        highlight_opened_files = "none",
        indent_markers = {
          enable = false,
        },
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
              symlink_open = "",
              arrow_open = "",
              arrow_closed = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
    })
  end,
}
