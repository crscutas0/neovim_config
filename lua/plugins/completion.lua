return {
	"saghen/blink.cmp",
	version = "*",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},
	opts = {
		-- Keymaps
		keymap = {
			preset = "default",
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<CR>"] = { "accept", "fallback" },
		},

		-- Sources
		sources = {
			default = { "lsp", "path", "buffer", "snippets" },
		},

		-- Completion UI
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 150,
				window = {
					border = "rounded",
					max_width = 50,
					max_height = 25,
				},
			},
			menu = { enabled = true },
			list = {
				selection = {
					preselect = false,
				},
			},
		},

		snippets = {
			expand = function(snippet)
				require("luasnip").lsp_expand(snippet)
			end,
			active = function()
				return require("luasnip").in_snippet()
			end,
			jump = function(dir)
				require("luasnip").jump(dir)
			end,
		},
	},
	config = function(_, opts)
		require("blink.cmp").setup(opts)
		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}
