-- Make sure to setup `mapleader` and `maplocalleader` before 
-- loading lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.shiftwidth = 4

vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

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
