return {
	cmd = { "pylsp" },
	filetypes = { "python" },
	init_options = {},
	settings = {
		pylsp = {
			plugins = {
				rope_autoimport = { enabled = true },
				rope_completion = { enabled = true },
			},
		},
	},
}
