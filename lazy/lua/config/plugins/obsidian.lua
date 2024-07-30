return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  event = {
    "BufReadPre /mnt/c/Users/ethan/OneDrive/Program Sync/Obsidian/personal/**.md",
    "BufNewFile /mnt/c/Users/ethan/OneDrive/Program Sync/Obsidian/personal/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "/mnt/c/Users/ethan/OneDrive/Program Sync/Obsidian/personal",
      },
    },
  },
}
