return {
  {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", }
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "neovim/nvim-lspconfig",
      "folke/snacks.nvim",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspconfig = require("lspconfig")

      require("luasnip.loaders.from_vscode").lazy_load()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Define on_attach function for keymaps
      local on_attach = function(_, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', '<C-r>', vim.lsp.buf.rename, opts)
        vim.keymap.set('i', '<C-r>', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
      end

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = { diagnostics = { globals = { "vim" } } },
        },
      })

      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.pylsp.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp", duplicates = 0 },
          { name = "luasnip", duplicates = 0 },
          { name = "buffer", duplicates = 0 },
          { name = "path", duplicates = 0 },
        }),
      })
    end,
  }
}
