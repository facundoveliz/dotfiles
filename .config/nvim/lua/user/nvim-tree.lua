require("nvim-tree").setup({
	update_cwd = true, -- update current directory when changed
	git = {
		enable = false,
	},
	view = {
		width = 30,
		side = "left",
		hide_root_folder = true,
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	diagnostics = {
		enable = false,
		show_on_dirs = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
})
