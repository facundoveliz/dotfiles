return {
	"vimwiki/vimwiki",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		vim.cmd([[
    let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': 'md'}]
    let g:vimwiki_table_mappings = 0
    let g:vimwiki_listsyms = '✗○◐●✓'
    ]])
	end,
}
