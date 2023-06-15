local M = {
	"kyazdani42/nvim-tree.lua",
	event = "VimEnter",
	keys = {
		{ "<C-b>", ":NvimTreeToggle<CR>" },
	},
}

function M.config()
	require("nvim-tree").setup({
		update_focused_file = {
			enable = true,
			update_cwd = true,
		},
		renderer = {
			icons = {
				glyphs = {
					default = "",
					symlink = "",
					folder = {
						arrow_open = "",
						arrow_closed = "",
						default = "",
						open = "",
						empty = "",
						empty_open = "",
						symlink = "",
						symlink_open = "",
					},
					git = {
						unstaged = "",
						staged = "S",
						unmerged = "",
						renamed = "➜",
						untracked = "U",
						deleted = "",
						ignored = "◌",
					},
				},
			},
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			icons = {
				hint = "●",
				info = "●",
				warning = "●",
				error = "●",
			},
		},
		view = {
			width = 30,
			side = "left",
		},
	})
end

return M
