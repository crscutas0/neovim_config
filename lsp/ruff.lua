return {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_dir = function(fname)
		return require("lspconfig.util").root_pattern("pyproject.toml", "ruff.toml", "setup.py", ".git")(fname)
			or require("lspconfig.util").path.dirname(fname)
	end,
	init_options = {
		settings = {
			args = {
				"--extend-select=DJ",
				"--line-length=119",
			},
		},
	},
}
