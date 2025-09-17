return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "frappe",
			custom_highlights = function()
				return {
					CursorLineNr = { fg = "#ffbf00", bold = true },
				}
			end,
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "main", -- auto, main, moon, or dawn
				-- dark_variant = "main",
				dim_inactive_windows = false,
				extend_background_behind_borders = true,

				enable = {
					terminal = true,
					legacy_highlights = true,
					migrations = true,
				},

				styles = {
					bold = true,
					italic = true,
					transparency = false,
				},
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,

		config = function()
			require("everforest").setup({
				background = "soft",
				on_highlights = function(highlights, _)
					highlights.LineNr = { fg = "#ffbf00", bold = true }
					highlights.CursorLineNr = { fg = "#ffbf00", bold = true }
				end,
			})
		end,
	},
	{
		"navarasu/onedark.nvim",
		priority = 1000,
		config = function()
			require("onedark").setup({
				style = "warm",
				colors = {},
				highlights = {
					CursorLineNr = { fg = "#ffbf00", fmt = "bold" },
				},
			})
			require("onedark")
		end,
	},
}
