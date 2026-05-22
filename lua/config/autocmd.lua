vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.svelte",
	callback = function()
		vim.bo.filetype = "html"
	end,
})
