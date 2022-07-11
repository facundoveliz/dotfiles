require("auto-session").setup({
	log_level = "info",
	auto_session_enabled = true,
	auto_save_enabled = true,
	auto_restore_enabled = true,
	pre_save_cmds = { "tabdo NvimTreeClose" },
})

-- autosave session before leaving vim
vim.cmd([[
    autocmd VimLeavePre * silent! :SaveSession
]])
