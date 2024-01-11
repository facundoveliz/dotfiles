return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "notes",
				path = "~/Notes",
			},
		},
		follow_url_func = function(url)
			vim.fn.jobstart({ "xdg-open", url })
		end,
	},
}
