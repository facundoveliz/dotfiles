return {
	"romgrk/barbar.nvim",
	event = { "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		animation = false,
		custom_colors = false,
		icons = {
			button = "",
			inactive = {
				separator = {
					left = "",
					right = "",
				},
			},
			separator = {
				left = "",
				right = "",
			},
			separator_at_end = false,
		},
		sidebar_filetypes = {
			NvimTree = true,
			undotree = { text = "undotree" },
			["neo-tree"] = { event = "BufWipeout" },
		},
		filetype = {
			enabled = true,
		},
	},
}
