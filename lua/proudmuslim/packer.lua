vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(user)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- UI
  use {
    'folke/noice.nvim',
    requires = {
      { 'MunifTanjim/nui.nvim' },
      { 'hrsh7th/nvim-cmp' }
    }
  }
  use 'rcarriga/nvim-notify'
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
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use('theprimeagen/harpoon')

  -- Syntax highlighting
  use 'brenoprata10/nvim-highlight-colors'
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use {
    'folke/todo-comments.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Text editing
  use('mbbill/undotree')
  use {
    'kylechui/nvim-surround',
    tag = '*',
  }

  -- LSP
  use {
    'mason-org/mason-lspconfig.nvim',
    requires = {
      {
        'mason-org/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'neovim/nvim-lspconfig'},

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/vim-vsnip' },
    }
  }
end)
