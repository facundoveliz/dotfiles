local M = {
	"romgrk/barbar.nvim",
	event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
}

M.opts = {
	animation = false,
	custom_colors = false,
	sidebar_filetypes = {
		undotree = { text = "undotree" },
	},
	icons = {
		buffer_index = true,
		filetype = {
			enabled = false,
		},
		button = false,
		separator = {
			left = "",
		},
	},
	filetype = {
		enabled = true,
	},
}

return M
