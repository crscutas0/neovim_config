return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			sections = {
				{ title = "Recent Files", padding = 1 },
				{ section = "recent_files", limit = 8, padding = 1 },
			},
		},
		explorer = { enabled = false },
		indent = { enabled = false },
		input = { enabled = true },
		rename = { enabled = true },
		picker = {
			enabled = true,
			matcher = {
				fuzzy = true,
				ignorecase = true,
				smartcase = false,
			},
		},
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = false },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		styles = {
			notification = {},
		},
		notifier = {
			enabled = true,
			timeout = 3000,
		},
		scratch = {
			ft = "markdown",
		},
	},
	keys = require("config.keymap.snacks"),
	init = require("config.keymap.snacks2"),
}
