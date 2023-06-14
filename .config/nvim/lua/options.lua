local opt = vim.opt

opt.ruler = true
opt.clipboard = "unnamedplus" -- sync with system clipboard
opt.cursorline = true -- enable highlighting of the current line
opt.completeopt = { "menu", "menuone", "noselect" }
opt.backspace = { "indent", "eol", "start" }
opt.fileencoding = "utf-8"
opt.mouse = "a" -- enable mouse mode
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.undodir"
opt.showmode = false
opt.ignorecase = true -- ignore case in searchs
opt.signcolumn = "yes" -- always show the signcolumn, otherwise it would shift the text each time
opt.sidescrolloff = 8 -- columns of context
opt.smartcase = true -- don't ingore case with capitals
opt.smartindent = true --insert indents automatically
opt.shiftwidth = 2 -- size of the indent
opt.smarttab = true
opt.expandtab = true -- use spaces instead of tabs
opt.list = true -- show some invisible characters (tabs...
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true -- true color support
opt.autoread = true
opt.writebackup = false
opt.updatetime = 200 -- save swap file and trigger cursorhold
opt.tabstop = 2
opt.number = true -- print line number
opt.relativenumber = true -- relative line number
opt.wrap = false -- disable line wrap
opt.scrolloff = 6 -- lines of context in scrolling
opt.incsearch = true
opt.hlsearch = true

vim.cmd([[au VimEnter * highlight clear LineNr]])
vim.cmd([[au BufWritePre * :%s/\s\+$//e]])
vim.cmd([[set iskeyword+=-]])
