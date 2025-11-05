return {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	init_options = {
		settings = {
			args = {
				"--extend-select=DJ",
				"--line-length=119",
			},
		},
	},
}
