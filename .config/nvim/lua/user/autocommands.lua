-- highlight yanked text for 200ms
vim.cmd([[
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=150})
  augroup END
]])

-- auto save/load folds
vim.cmd([[
  augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
  augroup END
]])

-- restores the last cursor position when opening a file
vim.cmd([[
  augroup last_cursor_position
    autocmd!
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' | execute "normal! g`\"zvzz" | endif
  augroup END
]])

-- barbar integration with file browsers
vim.api.nvim_create_autocmd("BufWinEnter", {
	callback = function(tbl)
		if vim.bo[tbl.buf].filetype == "neo-tree" then
			require("bufferline.api").set_offset(37, "FileTree")
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufWinLeave", "BufWipeout" }, {
	callback = function(tbl)
		if vim.bo[tbl.buf].filetype == "neo-tree" then
			require("bufferline.api").set_offset(0)
		end
	end,
})
