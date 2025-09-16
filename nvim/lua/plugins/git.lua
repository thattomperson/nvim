-- lazy.nvim
return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		lazygit = {
			config = {
				custom_commands = {
					{
						key = "Y",
						context = "global",
						description = "Git Town sYnc",
						command = "git town sync --all",
						stream = true,
						loadingText = "Syncing",
					},
				},
			},
		},
	},
}
