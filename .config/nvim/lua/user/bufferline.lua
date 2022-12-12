require("bufferline").setup({
	-- highlights = {
	-- 	fill = {
	-- 		bg = "#151515",
	-- 		fg = "#dedede",
	-- 	},
	-- },
	options = {
		mode = "buffers", -- set to "tabs" to only show tabpages instead
		numbers = "none",
		indicator = {
			style = "none",
		},
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 30,
		max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
		tab_size = 21,
		offsets = { { filetype = "NvimTree", text_align = "center" } },
		show_buffer_icons = false, -- disable filetype icons for buffers
		show_buffer_close_icons = false,
		show_close_icon = false,
		separator_style = "thin",
		always_show_bufferline = true,
		sort_by = "id", -- add custom logic
	},
})
