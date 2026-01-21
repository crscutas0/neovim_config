vim.api.nvim_create_autocmd("FileType", {
	pattern = "neo-tree",
	callback = function()
		-- vim.b.supermaven_disable = true
	end,
})
