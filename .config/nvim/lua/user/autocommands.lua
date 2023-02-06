-- highlight yanked text for 200ms
vim.cmd([[
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=150})
  augroup END
]])

-- start terminal in insert mode
vim.cmd([[
  augroup terminal
    au TermOpen * startinsert
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

-- don't show any numbers inside terminals
vim.cmd([[
  au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal
]])

-- restores the last cursor position when opening a file
vim.cmd([[
  augroup last_cursor_position
    autocmd!
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' | execute "normal! g`\"zvzz" | endif
  augroup END
]])
