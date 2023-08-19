local M = {
	"lambdalisue/fern.vim",
	event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
	keys = {
		{ "<C-b>", ":Fern . -drawer -toggle<CR>" },
	},
	dependencies = {
		{
			"lambdalisue/fern-git-status.vim",
			event = "VeryLazy",
		},
		{
			"lambdalisue/nerdfont.vim",
			event = "VeryLazy",
		},
		{
			"lambdalisue/fern-renderer-nerdfont.vim",
		},
		{
			"lambdalisue/fern-hijack.vim",
			event = "VeryLazy",
		},
	},
}

vim.g["fern#renderer"] = "nerdfont"
vim.g["fern#default_hidden"] = 0
vim.g["fern#disable_default_mappings"] = 1

vim.cmd([[
function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> o <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> s <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> dd <Plug>(fern-action-remove)
  nmap <buffer> r <Plug>(fern-action-rename)
  nmap <buffer> h <Plug>(fern-action-hidden-toggle)
  nmap <buffer> R <Plug>(fern-action-reload:all)
  nmap <buffer> m <Plug>(fern-action-clipboard-move)
  nmap <buffer> y <Plug>(fern-action-clipboard-copy)
  nmap <buffer> p <Plug>(fern-action-clipboard-paste)
  nmap <buffer> ` <Plug>(fern-action-mark:toggle)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END
]])

return M
