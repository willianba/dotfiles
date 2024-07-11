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

local diagnostics = function()
  local opts = { severity_bound = 0 }
  require("telescope.builtin").diagnostics(opts)
end

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.2",
  cmd = { "Telescope" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "BurntSushi/ripgrep",
    "nvim-tree/nvim-web-devicons",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
    },
    {
      "debugloop/telescope-undo.nvim",
      keys = {
        {
          "<leader>u",
          "<cmd>Telescope undo<cr>",
          desc = "undo history",
        },
      },
    },
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
    { "<leader>fh", "<cmd>Telescope harpoon marks<cr>" },
    { "<leader>tr", diagnostics },
    -- LSP mappings below
    { "gs", "<cmd>Telescope lsp_document_symbols<cr>" },
    { "gd", "<cmd>Telescope lsp_definitions<cr>" },
    { "gr", "<cmd>Telescope lsp_references<cr>" },
    { "gD", "<cmd>Telescope lsp_declarations<cr>" },
    { "gi", "<cmd>Telescope lsp_implementations<cr>" },
    { "gt", "<cmd>Telescope lsp_type_definitions<cr>" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    telescope.setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
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
        layout_strategy = "vertical",
        layout_config = {
          vertical = {
            mirror = true,
            prompt_position = "top",
            preview_height = 0.6,
          },
          horizontal = {
            prompt_position = "top",
          },
        },
        path_display = {
          truncate = 5,
        },
        prompt_prefix = " ",
        selection_caret = " ",
        mappings = {
          i = { ["Q"] = actions.close },
        },
      },
      extensions = {
        fzf = {
          case_mode = "ignore_case",
        },
        undo = {
          side_by_side = true,
          saved_only = true,
        },
      },
    })
    telescope.load_extension("fzf")
    telescope.load_extension("workspaces")
    telescope.load_extension("harpoon")
    telescope.load_extension("undo")
  end,
}
