-- this file tracks new and replaced plugins

return {
   ["goolord/alpha-nvim"] = {
    disable = false,
      config = function()
        require "plugins.configs.alpha"
      end,
  },
  ["EdenEast/nightfox.nvim"] = {},
  ["pineapplegiant/spaceduck"] = {
    branch = "main",
  },
  ["nvim-telescope/telescope-project.nvim"]= {
    after = 'telescope.nvim',
  },
  ["nvim-treesitter/nvim-treesitter-context"] = {
    after = 'nvim-treesitter',
    config = function()
      local present, ts_context = pcall(require, 'nvim-treesitter-context')

      if present then
        ts_context.setup()
      end
    end,
    setup = function ()
      require('core.utils').packer_lazy_load 'nvim-treesitter-context'
    end
  },
  ["tpope/vim-endwise"] = {
    setup = function ()
      require('core.utils').packer_lazy_load 'vim-endwise'
    end
  },
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
    config = function ()
      local present, autotag = pcall(require, 'nvim-ts-autotag')

      if present then
        autotag.setup()
      end
    end,
    setup = function ()
      require('core.utils').packer_lazy_load 'nvim-ts-autotag'
    end
  },
  ["karb94/neoscroll.nvim"] = {
    config = function()
      local present, neoscroll = pcall(require, 'neoscroll.nvim')

      if present then
        neoscroll.setup()
      end
      require "neoscroll".setup {}
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
