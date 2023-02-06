require("neo-tree").setup({
	hide_hidden = false, -- only works on Windows for hidden files/directories
	hide_by_name = {
		"node_modules",
	},
	window = {
		mappings = {
			["o"] = "open",
			["s"] = "open_split",
			["v"] = "open_vsplit",
		},
	},
})
