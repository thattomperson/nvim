return {
	{
		"snacks.nvim",
		opts = {
			scroll = { enabled = false },
			picker = {
				sources = {
					-- Configure explorer to behave more like oil
					explorer = {
						auto_close = true,
						layout = { preset = "default" },
					},
				},
			},
		},
	},
}
