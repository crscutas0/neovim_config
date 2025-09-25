return {
	cmd = { "pylsp" },
	filetypes = { "python" },
	init_options = {},
	settings = {
		pylsp = {
			plugins = {
				pyflakes = { enabled = true },
				rope_autoimport = { enabled = true },
			},
		},
	},
}
