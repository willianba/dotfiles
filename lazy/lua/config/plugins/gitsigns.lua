return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  config = {
    current_line_blame = true,
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "契" },
      topdelete = { text = "契" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
  },
}
