local M = {
  "lambdalisue/fern.vim",
  event = "VimEnter",
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
      event = "VeryLazy",
    },
    {
      "lambdalisue/fern-hijack.vim",
      event = "VeryLazy",
    },
  },
}

vim.g["fern#renderer"] = "nerdfont"
vim.g["fern#default_hidden"] = 1

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
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> h <Plug>(fern-action-hidden-toggle)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> s <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END
]])

return M
