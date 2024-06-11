vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(user)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- UI
  use {
    'folke/noice.nvim',
    requires = {
      {'MunifTanjim/nui.nvim'},
      {'hrsh7th/nvim-cmp' }
    }
  }
  use {
      'rose-pine/neovim',
      as = 'rose-pine',
      config = function()
          vim.cmd('colorscheme rose-pine')
      end
  }

  -- Navigation
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  use('theprimeagen/harpoon')

  -- Syntax highlighting
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use {
      'folke/todo-comments.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Misc
  use('mbbill/undotree')

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }
end)

