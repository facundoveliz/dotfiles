local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = { "" }, -- List of parsers to ignore installing
	ensure_installed = {
		"bash",
		"make",
		"cmake",
		"lua",
		"rust",
		"toml",
		"go",
		"python",
		"regex",
		"yaml",
		"vim",
		"html",
		"json",
		"javascript",
		"typescript",
		"tsx",
		"scss",
		"css",
	}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
})
