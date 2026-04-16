-- Make sure to setup `mapleader` and `maplocalleader` before 
-- loading lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.shiftwidth = 4

vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.cindent = true

-- Don't wrap lines.
vim.opt.wrap = false

vim.opt.swapfile = false

-- Inc search to make things easier
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.updatetime = 50

vim.opt.signcolumn = "yes"

-- Line numbers
vim.wo.relativenumber = true
vim.wo.number = true

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'rust', 'haskell', 'lua', 'html', 'css', 'python', 'javascript',
  'markdown', 'sh', 'fish', 'bash', 'nix', 'ssh_config', 'toml', 'json',
  'jsonc', 'zathurarc', 'diff', 'git_config', 'git_rebase', 'gitattributes',
  'gitcommit', 'gitignore' },
  callback = function()
    -- syntax highlighting, provided by Neovim
    vim.treesitter.start()
    -- folds, provided by Neovim
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    -- vim.wo.foldmethod = 'expr'
    -- indentation, provided by nvim-treesitter
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
