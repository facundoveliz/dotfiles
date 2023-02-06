vim.opt.ruler = true
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.fileencoding = "utf-8"
vim.opt.mouse = "a"
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.undodir"
vim.opt.showmode = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.autoread = true
vim.opt.writebackup = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 6
vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.cmd([[au VimEnter * highlight clear LineNr]])
vim.cmd([[au BufWritePre * :%s/\s\+$//e]])
vim.cmd([[set iskeyword+=-]])
