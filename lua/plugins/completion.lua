return {
	"saghen/blink.cmp",
	version = "*",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},
	opts = {
		keymap = require("config.keymap.completion"),

		signature = {
			enabled = true,
			trigger = {
				enabled = false,
			},
			window = {
				treesitter_highlighting = true,
				show_documentation = false,
				direction_priority = { "s", "n" },
			},
		},

		sources = {
			default = { "lsp", "path", "buffer", "snippets" },
			per_filetype = {
				text = { "buffer", "path" },
				sql = { "snippets", "dadbod", "buffer" },
			},
			providers = {
				dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
			},
		},

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

			menu = {
				enabled = true,
				auto_show = true,
			},

			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				},
			},

			ghost_text = {
				enabled = true,
				show_with_selection = true,
				-- show_without_selection = true,
				show_with_menu = true,
				-- show_without_menu = true,
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
