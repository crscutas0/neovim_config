return {
	cmd = { "pylsp" },
	filetypes = { "python" },
	init_options = {},
	settings = {
		pylsp = {
			plugins = {
				rope_completion = { enabled = true },
				rope_rename = { enabled = true },
				rope = { enabled = true },
				pylsp_code_actions = { enabled = true },
				rope_autoimport = { enabled = true },
			},
		},
	},
}
