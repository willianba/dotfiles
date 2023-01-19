local project_files = function()
  local opts = {}
  if vim.loop.fs_stat(".git") then
    opts.show_untracked = true
    require("telescope.builtin").git_files(opts)
  else
    local client = vim.lsp.get_active_clients()[1]
    if client then
      opts.cwd = client.config.root_dir
    end
    require("telescope.builtin").find_files(opts)
  end
end

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.0",
  cmd = { "Telescope" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "BurntSushi/ripgrep",
    "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    {
      "natecraddock/workspaces.nvim",
      cmd = { "WorkspaceOpen" },
      keys = {
        { "<leader>tw", "<cmd>Telescope workspaces<cr>" },
      },
    },
  },
  keys = {
    { "<leader>ff", project_files },
    { "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>" },
    { "<leader>fo", "<cmd>Telescope oldfiles<cr>" },
    { "<leader>fw", "<cmd>Telescope live_grep<cr>" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>" },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>" },
    { "<leader>fr", "<cmd>Telescope lsp_references<cr>" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    telescope.setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim",
        },
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
          },
        },
        path_display = { "truncate" },
        set_env = { COLORTERM = "truecolor" },
        prompt_prefix = " ",
        selection_caret = " ",
        mappings = {
          i = { ["Q"] = actions.close },
        },
      },
    })
    telescope.load_extension("fzf")
    telescope.load_extension("workspaces")
  end,
}
