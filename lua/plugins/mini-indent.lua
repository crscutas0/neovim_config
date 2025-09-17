return {
	"nvim-mini/mini.indentscope",
	version = "*",
	opts = {
		draw = {
			delay = 100,
			predicate = function(scope)
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
	},
}
