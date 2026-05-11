return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  dependencies = {
    { "HiPhish/rainbow-delimiters.nvim" },
    { "windwp/nvim-ts-autotag" },
    {
      "nvim-treesitter/nvim-treesitter-context",
      config = function()
        require("treesitter-context").setup({
          multiline_threshold = 1,
        })
      end,
    },
  },
  config = function()
    local autocmd = vim.api.nvim_create_autocmd
    local ensure_installed = {
      "bash",
      "css",
      "go",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "rust",
      "sql",
      "svelte",
      "typescript",
      "yaml",
      "vim",
    }

    local already_installed = require("nvim-treesitter.config").get_installed()
    local parsers_to_install = vim
      .iter(ensure_installed)
      :filter(function(parser)
        return not vim.tbl_contains(already_installed, parser)
      end)
      :totable()

    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    require("nvim-treesitter").install(parsers_to_install)
    require("nvim-ts-autotag").setup()

    local group = vim.api.nvim_create_augroup("user_treesitter", { clear = true })
    autocmd("FileType", {
      group = group,
      callback = function(event)
        local bufnr = event.buf
        local filetype = vim.bo[bufnr].filetype
        if filetype == "" or not vim.treesitter.language.add then
          return
        end

        local has_parser = pcall(vim.treesitter.language.add, filetype)
        if not has_parser then
          return
        end

        pcall(vim.treesitter.start, bufnr)
        vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
