return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = false },
		explorer = { enabled = false },
		indent = { enabled = false },
		input = { enabled = true },
		picker = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
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
