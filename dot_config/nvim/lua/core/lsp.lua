vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local buffer = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("core.lsp_mappings").on_attach(client, buffer)
  end,
})

for name, icon in pairs(require("settings.icons").diagnostics) do
  name = "DiagnosticSign" .. name
  vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end

vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 2, prefix = "●" },
  severity_sort = true,
  float = {
    border = "single",
    source = true,
  },
})

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = "single"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
