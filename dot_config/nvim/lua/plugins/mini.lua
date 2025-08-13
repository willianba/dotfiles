return {
  {
    "echasnovski/mini.pairs",
    event = "BufReadPost",
    config = function()
      require("mini.pairs").setup()
    end,
  },
  {
    "echasnovski/mini.comment",
    event = "BufReadPost",
    config = function()
      require("mini.comment").setup({
        mappings = {
          comment = "<leader>/",
          comment_line = "<leader>/",
          comment_visual = "<leader>/",
          textobject = "<leader>/",
        },
      })
    end,
  },
}
