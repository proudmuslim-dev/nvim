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
    event = "VeryLazy",
    version = "^3.0.0"
  },
}
