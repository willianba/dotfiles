-- this file tracks new and replaced plugins

return {
  ["goolord/alpha-nvim"] = {
    disable = false
  },
  ["natecraddock/workspaces.nvim"] = {
    config = function ()
      local present, workspaces = pcall(require, 'workspaces')

      if present then
        workspaces.setup {
          open = { "NVimTreeRefresh" }
        }
      end
    end
  },
  ["airblade/vim-gitgutter"] = {
    config = function ()
      vim.g.gitgutter_signs = 0
    end,
    setup = function ()
      require('core.utils').packer_lazy_load 'vim-gitgutter'
    end
  },
  ["APZelos/blamer.nvim"] = {
    config = function ()
      vim.g.blamer_enabled = 1
    end,
    setup = function ()
      require('core.utils').packer_lazy_load 'blamer.nvim'
    end
  },
  ["folke/trouble.nvim"] = {
    config = function ()
      local present, trouble = pcall(require, 'trouble.nvim')

      if present then
        trouble.setup {}
      end
    end,
    setup = function ()
      require('core.utils').packer_lazy_load 'trouble.nvim'
    end
  },
  ["nvim-treesitter/nvim-treesitter-context"] = {
    after = 'nvim-treesitter',
    config = function()
      local present, ts_context = pcall(require, 'treesitter-context')

      if present then
        ts_context.setup {}
      end
    end,
    setup = function ()
      require('core.utils').packer_lazy_load 'nvim-treesitter-context'
    end
  },
  -- ["tpope/vim-endwise"] = { -- not working https://github.com/nvim-treesitter/nvim-treesitter/issues/703
  --   setup = function ()
  --     require('core.utils').packer_lazy_load 'vim-endwise'
  --   end
  -- },
  ["tpope/vim-surround"] = {
    setup = function ()
      require('core.utils').packer_lazy_load 'vim-surround'
    end
  },
  ["github/copilot.vim"] = {
    setup = function ()
      require('core.utils').packer_lazy_load 'copilot.vim'
    end
  },
  ["p00f/nvim-ts-rainbow"] = {
    after = 'nvim-treesitter',
    setup = function ()
      require('core.utils').packer_lazy_load 'nvim-ts-rainbow'
    end
  },
  ["windwp/nvim-ts-autotag"] = {
    after = 'nvim-treesitter',
    setup = function ()
      require('core.utils').packer_lazy_load 'nvim-ts-autotag'
    end
  },
  ["karb94/neoscroll.nvim"] = {
    config = function()
      local present, neoscroll = pcall(require, 'neoscroll')

      if present then
        neoscroll.setup {}
      end
    end,
    setup = function()
      require('core.utils').packer_lazy_load 'neoscroll.nvim'
    end,
  },
  ["mg979/vim-visual-multi"] = {
    branch = 'master',
    setup = function ()
      require('core.utils').packer_lazy_load 'vim-visual-multi'
    end
  }
}
