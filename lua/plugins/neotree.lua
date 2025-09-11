return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
		opts = {
			filesystem = {
				filtered_items = {
					always_show = { ".env", ".gitignore" },
					always_show_by_pattern = {
						".env*",
					},
				},
				follow_current_file = {
					enabled = true,
				},
			},
			window = {
				width = 40,
			},
		},
		keys = require("config.keymap.neotree"),
	},
}
