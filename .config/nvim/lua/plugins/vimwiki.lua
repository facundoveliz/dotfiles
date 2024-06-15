return {
  "vimwiki/vimwiki",
  config = function()
    vim.cmd [[
    let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': 'md'}]

    let g:vimwiki_table_mappings = 0

    let g:vimwiki_listsyms = '✗○◐●✓'

    " sets syntax to markdonw instead
    " multiple wikis, look at vimwiki_list path, must match
    ]]
  end,
}
