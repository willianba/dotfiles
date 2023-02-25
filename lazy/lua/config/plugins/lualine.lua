local function cwd()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end

local function get_lsp_name()
  local buf_ft = vim.bo.filetype
  local clients = vim.lsp.get_active_clients()
  local _, devicons = pcall(require, "nvim-web-devicons")
  local lsp_icon = devicons.get_icon("lsp", buf_ft)

  if next(clients) == nil then
    return ""
  end

  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return lsp_icon .. " " .. client.name
    end
  end
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    {
      {
        "nvim-tree/nvim-web-devicons",
        config = function()
          require("nvim-web-devicons").set_icon({
            lsp = {
              icon = " ",
              color = "#7ebae4",
              name = "lsp",
            },
          })
        end,
      },
    },
  },
  config = function()
    require("lualine").setup({
      options = {
        theme = vim.g.colors_name,
        component_separators = "|",
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" } } },
        lualine_b = { { "filetype", icon_only = true, padding = { left = 1, right = 0 }, separator = {} }, "filename" },
        lualine_c = { "branch", "diff" },
        lualine_x = { "diagnostics", cwd, get_lsp_name },
        lualine_y = { { "location", padding = 0 } },
        lualine_z = { { "progress", separator = { right = "" } } },
      },
    })
  end,
}
