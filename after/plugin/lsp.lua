local cmp = require('cmp')
local cmp_lsp = require("cmp_nvim_lsp")
local capabilities = vim.tbl_deep_extend(
  "force",
  {},
  vim.lsp.protocol.make_client_capabilities(),
  cmp_lsp.default_capabilities()
)

require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { 'rust_analyzer', 'hls', 'clangd', 'lua_ls', 'html' },

  handlers = {
    function(server) -- default handler
      require("lspconfig")[server].setup {
        capabilities = capabilities
      }
    end,
  }
}

-- CMP
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup {
  snippet = { 
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), 
    ['<C-Space>'] = cmp.mapping.complete(), --  TODO: New keybind, would rather save this for fcitx5
  }),
  
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' }
  })
}
