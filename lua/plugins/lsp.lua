return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        ensure_installed = { "lua_ls", "ts_ls", "pyright" },
      })

      local servers = { "lua_ls", "ts_ls", "pyright" }
      for _, server in ipairs(servers) do
        lspconfig[server].setup({})
      end

      local on_attach = function(_, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', '<C-r>', vim.lsp.buf.rename, opts)
        vim.keymap.set('i', '<C-r>', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
      end

      lspconfig.lua_ls.setup({
        root_dir = lspconfig.util.root_pattern(".git", "."),
      })

      lspconfig.pyright.setup({
        on_attach = on_attach
      })

      lspconfig.jdtls.setup({
        on_attach = on_attach
      })

      lspconfig.ts_ls.setup({
        on_attach = on_attach
      })
    end,
  },
  -- {
  --   "hrsh7th/nvim-cmp", -- Completion plugin
  --   dependencies = {
  --     "hrsh7th/cmp-nvim-lsp", -- LSP source
  --     "hrsh7th/cmp-buffer",   -- Buffer source
  --     "hrsh7th/cmp-path",     -- File path source
  --     "hrsh7th/cmp-cmdline",  -- Command line source
  --     "L3MON4D3/LuaSnip",     -- Snippet engine
  --     "saadparwaiz1/cmp_luasnip", -- LuaSnip completion source
  --   },
  --   config = function()
  --     local cmp = require("cmp")
  --     local luasnip = require("luasnip")
  --
  --     cmp.setup({
  --       snippet = {
  --         expand = function(args)
  --           luasnip.lsp_expand(args.body)
  --         end,
  --       },
  --       mapping = cmp.mapping.preset.insert({
  --         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  --         ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --         ["<C-Space>"] = cmp.mapping.complete(),
  --         ["<C-e>"] = cmp.mapping.abort(),
  --         ["<CR>"] = cmp.mapping.confirm({ select = true }),
  --       }),
  --       sources = cmp.config.sources({
  --         { name = "nvim_lsp" },
  --         { name = "luasnip" },
  --         { name = "buffer" },
  --         { name = "path" },
  --       }),
  --     })
  --   end,
  -- },
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },

    version = '1.*',
    opts = {
      keymap = { 
        preset = 'default',
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
      },
      appearance = {
        nerd_font_variant = 'mono'
     },

      completion = { documentation = { auto_show = false } },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      fuzzy = { implementation = "lua" }
    },
    opts_extend = { "sources.default" }
  }
}
