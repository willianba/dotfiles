return {
  "stevearc/dressing.nvim",
  event = "BufReadPost",
  init = function()
    vim.ui.select = function(...)
      require("core.lazy").load({ plugins = { "dressing.nvim" } })
      return vim.ui.select(...)
    end
    vim.ui.input = function(...)
      require("core.lazy").load({ plugins = { "dressing.nvim" } })
      return vim.ui.input(...)
    end
  end,
}
