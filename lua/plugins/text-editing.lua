return {
  {
    "mbbill/undotree",
    lazy = false,
    init = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    end
  },
  {
    "kylechui/nvim-surround",
    lazy = false,
  },
}
