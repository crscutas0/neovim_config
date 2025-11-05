return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			sections = {
				{
					section = "terminal",
					cmd = "pokemon-colorscripts -r 1 --no-title; sleep .1",
					random = 10,
					pane = 2,
					indent = 4,
					height = 30,
				},
				{ title = "Recent Files", padding = 1 },
				{ section = "recent_files", limit = 8, padding = 1 },
			},
		},
		explorer = { enabled = false },
		indent = { enabled = false },
		input = { enabled = true },
		rename = { enabled = true },
		picker = { enabled = true },
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
