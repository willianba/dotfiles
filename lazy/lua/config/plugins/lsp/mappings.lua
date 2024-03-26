local M = {}

function M.on_attach(client, buffer)
  local self = M.new(client, buffer)

  self:map("<leader>f", vim.diagnostic.open_float)
  self:map("<leader>xd", "Telescope diagnostics")
  self:map("gd", "Telescope lsp_definitions")
  self:map("gr", "Telescope lsp_references")
  self:map("gD", "Telescope lsp_declarations")
  self:map("gi", "Telescope lsp_implementations")
  self:map("gt", "Telescope lsp_type_definitions")
  self:map("K", vim.lsp.buf.hover)
  self:map("[d", M.diagnostic_goto(true))
  self:map("]d", M.diagnostic_goto(false))
  self:map("]e", M.diagnostic_goto(true, "ERROR"))
  self:map("[e", M.diagnostic_goto(false, "ERROR"))
  self:map("]w", M.diagnostic_goto(true, "WARNING"))
  self:map("[w", M.diagnostic_goto(false, "WARNING"))

  self:map("<C-s>", vim.lsp.buf.signature_help, { mode = { "i", "n" }, has = "signatureHelp" })
  self:map("<leader>ca", vim.lsp.buf.code_action, { mode = { "n", "v" }, has = "codeAction" })

  -- local format = require("config.plugins.lsp.format").format
  -- self:map("<leader>fm", format, { has = "documentFormatting" })
  -- self:map("<leader>fm", format, { mode = "v", has = "documentRangeFormatting" })
  self:map("<leader>ra", vim.lsp.buf.rename, { has = "rename" })

  if client.name == "tsserver" and pcall(require, "typescript") then
    self:map("<leader>co", "TypescriptOrganizeImports")
    self:map("<leader>cR", "TypescriptRenameFile")
  end
end

function M.new(client, buffer)
  return setmetatable({ client = client, buffer = buffer }, { __index = M })
end

function M:has(cap)
  return self.client.server_capabilities[cap .. "Provider"]
end

function M:map(lhs, rhs, opts)
  opts = opts or {}
  if opts.has and not self:has(opts.has) then
    return
  end
  vim.keymap.set(
    opts.mode or "n",
    lhs,
    type(rhs) == "string" and ("<cmd>%s<cr>"):format(rhs) or rhs,
    { silent = true, buffer = self.buffer, expr = opts.expr }
  )
end

function M.diagnostic_goto(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

return M
