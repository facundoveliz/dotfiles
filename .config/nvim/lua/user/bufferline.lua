require("bufferline").setup({
	-- highlights = {
	-- 	fill = {
	-- 		guibg = {
	-- 			attribute = "bg",
	-- 			highlight = "Pmenu",
	-- 		},
	-- 	},
	-- },
	options = {
		mode = "buffers", -- set to "tabs" to only show tabpages instead
		numbers = "none",
		indicator_icon = "▎",
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		tab_size = 18,
		-- diagnostics = "nvim_lsp",
		-- diagnostics_update_in_insert = false,
		-- diagnostics_indicator = function(count, level, diagnostics_dict, context)
		-- 	return "(" .. count .. ")"
		-- end,
		offsets = { { filetype = "NvimTree", text_align = "center" } },
		show_buffer_icons = false, -- disable filetype icons for buffers
		show_buffer_close_icons = false,
		show_close_icon = false,
		separator_style = "thin",
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		sort_by = "id", -- add custom logic
	},
})
