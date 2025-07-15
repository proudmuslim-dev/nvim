vim.keymap.set("n", "<leader>ef", vim.cmd.Ex)

-- Move highlighted lines around with ease.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
