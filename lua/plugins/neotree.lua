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
			event_handlers = {
				{
					event = "neo_tree_buffer_enter",
					handler = function()
						if vim.bo.filetype ~= "neo-tree" then
							return
						end

						vim.api.nvim_create_autocmd("CursorMoved", {
							buffer = 0,
							callback = function()
								local line = vim.api.nvim_get_current_line()
								local row = vim.api.nvim_win_get_cursor(0)[1]

								local start = line:find("[%w._%-%+~]") or line:find("%S") or 1
								local col = math.max(0, start - 1)

								local _, current_col = unpack(vim.api.nvim_win_get_cursor(0))
								if current_col ~= col then
									pcall(vim.api.nvim_win_set_cursor, 0, { row, col })
								end
							end,
						})
					end,
				},
			},
		},
		keys = require("config.keymap.neotree"),
	},
}
