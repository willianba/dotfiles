local autocmd = vim.api.nvim_create_autocmd

autocmd("InsertEnter", {
  callback = function()
    vim.opt.relativenumber = false
  end,
})

autocmd("InsertLeave", {
  callback = function()
    vim.opt.relativenumber = true
  end,
})

-- fix terraform syntax highlighting
autocmd("BufEnter", {
  pattern = "*.tf",
  callback = function()
    vim.opt.filetype = "terraform"
  end,
})

autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

autocmd("FileType", {
  callback = function()
    -- Enable treesitter highlighting and disable regex syntax
    pcall(vim.treesitter.start)
    -- Enable treesitter-based indentation
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- built-in LSP completion
autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_completion", { clear = true }),
  callback = function(args)
    local client_id = args.data.client_id
    if not client_id then
      return
    end

    local client = vim.lsp.get_client_by_id(client_id)
    if client and client:supports_method("textDocument/completion") then
      -- Enable native LSP completion for this client + buffer
      vim.lsp.completion.enable(true, client_id, args.buf, {
        autotrigger = true, -- auto-show menu as you type
      })
    end
  end,
})

-- disable autocomplete for nofile buffers (e.g. help, quickfix, telescope etc)
autocmd("BufEnter", {
  callback = function()
    if vim.bo.buftype == "nofile" then
      vim.o.autocomplete = false
      return
    end
    vim.o.autocomplete = true
  end,
})

autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    local stats = require("lazy").stats()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    print("⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms")
  end,
})
