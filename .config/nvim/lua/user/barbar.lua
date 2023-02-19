require("bufferline").setup({
	animation = false,

	-- Enable/disable close button
	closable = false,

	-- Disable highlighting alternate buffers
	highlight_alternate = false,

	-- Enable highlighting visible buffers
	highlight_visible = true,

	-- Enable/disable icons
	-- if set to 'numbers', will show buffer index in the tabline
	-- if set to 'both', will show buffer index and icons in the tabline
	icons = "numbers",

	-- Configure icons on the bufferline.
	icon_separator_active = "",
	icon_separator_inactive = "",
	icon_close_tab_modified = "●",

	-- If true, new buffers will be inserted at the start/end of the list.
	-- Default is to insert after current buffer.
	insert_at_end = true,

	-- Sets the maximum padding width with which to surround each tab
	maximum_padding = 1,

	-- Sets the minimum padding width with which to surround each tab
	minimum_padding = 1,

	-- Sets the maximum buffer name length.
	maximum_length = 30,
})

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- buffers
keymap("n", "<S-l>", "<Cmd>BufferNext<CR>", opts)
keymap("n", "<S-h>", "<Cmd>BufferPrevious<CR>", opts)
-- NOTE: use this if the barbar isn't installed
-- keymap("n", "<S-l>", "<cmd>:bnext<CR>", opts)
-- keymap("n", "<S-h>", "<cmd>:bprev<CR>", opts)

-- reorder buffers
keymap("n", "<A-l>", "<Cmd>BufferMoveNext<CR>", opts)
keymap("n", "<A-h>", "<Cmd>BufferMovePrevious<CR>", opts)

-- goto buffer in position
keymap("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
keymap("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
keymap("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
keymap("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
keymap("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
keymap("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
keymap("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
keymap("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
keymap("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
keymap("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)

-- close buffer without closing the window
keymap("n", "tc", "<cmd>bp|bd #<CR>", opts)
keymap("n", "tx", "<cmd>bp|bd! #<CR>", opts)
