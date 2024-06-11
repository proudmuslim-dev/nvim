local todo = require("todo-comments")

todo.setup()

vim.keymap.set("n", "]t", function() todo.jump_next() end)
vim.keymap.set("n", "[t", function() todo.jump_prev() end)
