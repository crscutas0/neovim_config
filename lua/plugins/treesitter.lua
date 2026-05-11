return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install({
				"typescript",
				"javascript",
				"go",
				"css",
				"html",
				"lua",
				"json",
				"bash",
				"zsh",
				"python",
				"htmldjango",
			})
		end,
	},
}
