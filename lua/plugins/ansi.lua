return {
  {
    "m00qek/baleia.nvim",
    config = function()
      vim.g.baleia = require("baleia").setup({ })

      -- Command to colorize the current buffer
      vim.api.nvim_create_user_command("BaleiaColorize", function()
        vim.g.baleia.once(vim.api.nvim_get_current_buf())
      end, { bang = true })

      -- Command to show logs 
      vim.api.nvim_create_user_command("BaleiaLogs", vim.cmd.messages, { bang = true })

      -- Automatically colorize content piped from stdin
      vim.api.nvim_create_autocmd('StdinReadPost', {
        callback = function(args)
          vim.g.baleia.once(args.buf)
          vim.api.nvim_set_option_value("modified", false, { buf = args.buf })
        end,
      })
    end,
  }
}
