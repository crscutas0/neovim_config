return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install({
				ensure_installed = {
					"java",
					"lua",
					"go",
					"python",
					"typescript",
					"javascript",
					"tsx",
					"html",
					"htmldjango",
					"css",
					"markdown",
					"json",
					"svelte",
					"sql",
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
