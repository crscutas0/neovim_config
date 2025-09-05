return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false,
		opts = {
			filesystem = {
				filtered_items = {
					always_show = { ".env", ".gitignore" },
				},
				follow_current_file = {
					enabled = true,
				},
			},
			window = {
				width = 35,
			},
		},
		keys = {
			{ "<leader>nt", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" },
			{ "<leader>ne", "<cmd>Neotree focus<cr>", desc = "Focus Neo-tree" },
		},
	},
}
