return function(_, bufnr)
	local map = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
	end

	map("n", "K", vim.lsp.buf.hover, "Hover")
	map("n", "<C-r>", vim.lsp.buf.rename, "Rename")
	map("n", "<C-Space>", vim.lsp.buf.code_action, "Code Action")
	map("n", "<leader>ef", function()
		vim.lsp.buf.format({ async = true })
	end, "Format")
end
