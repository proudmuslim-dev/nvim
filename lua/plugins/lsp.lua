return {
  {
    "mason-org/mason-lspconfig.nvim",
    event = "VeryLazy",
    config = function()
      local cmp = require("cmp")
      local cmp_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities()
      )

      require("mason").setup()
      require("mason-lspconfig").setup {
        ensure_installed = { "rust_analyzer", "hls", "clangd", "lua_ls", "html" },

        handlers = {
          function(server) -- default handler
            require("lspconfig")[server].setup {
              capabilities = capabilities
            }
          end,
        }
      }

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function()
          vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
        end
      })

      -- CMP
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      cmp.setup {
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-m>"] = cmp.mapping.complete(),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" }
        })
      }

      -- Fix irritating default
      vim.keymap.set('n', ']d', function()
        vim.diagnostic.goto_next({ float = true })
      end)

      vim.keymap.set('n', '[d', function()
        vim.diagnostic.goto_prev({ float = true })
      end)
    end,
    dependencies = {
      {
        "mason-org/mason.nvim",
        build = function()
          pcall(vim.cmd, "MasonUpdate")
        end
      },
      "neovim/nvim-lspconfig",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/vim-vsnip",
    }
  }
}
