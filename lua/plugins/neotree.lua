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
		},
		keys = {
			{ "<leader>et", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" },
			{ "<leader>ee", "<cmd>Neotree focus<cr>", desc = "Focus Neo-tree" },
			-- { "<leader>s", "<cmd>Neotree show<cr>",  desc = "Show Neo-tree (no focus)" },
			-- { "<leader>c", "<cmd>Neotree close<cr>", desc = "Close Neo-tree" },
		},
	},
}
