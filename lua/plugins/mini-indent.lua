return {
	"nvim-mini/mini.indentscope",
	version = "*",
	config = function()
		require("mini.indentscope").setup({
			draw = {
				delay = 100,
				animation = require("mini.indentscope").gen_animation.linear({ duration = 50, unit = "total" }),
				-- animation = require("mini.indentscope").gen_animation.none(),
				predicate = function(scope)
					if not vim.api.nvim_buf_is_valid(scope.buf_id) then
						return false
					end
					if vim.bo[scope.buf_id].filetype == "neo-tree" then
						return false
					end
					return not scope.body.is_incomplete
				end,
				priority = 2,
			},

			options = {
				border = "both",
				indent_at_cursor = false,
				n_lines = 10000,
				try_as_border = false,
			},

			symbol = "╎",
		})
	end,
}
