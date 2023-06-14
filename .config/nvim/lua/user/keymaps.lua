local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- easier navigation between split windows
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- use alt + hjkl to resize windows
keymap("n", "<M-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<M-j>", ":resize +2<CR>", opts)
keymap("n", "<M-k>", ":resize -2<CR>", opts)
keymap("n", "<M-l>", ":vertical resize +2<CR>", opts)

-- move cursor in input mode
keymap("i", "<A-h>", "<left>", opts)
keymap("i", "<A-j>", "<down>", opts)
keymap("i", "<A-k>", "<up>", opts)
keymap("i", "<A-l>", "<right>", opts)

-- don't lose selection after indent
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- keep cursor centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- better text moving
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("n", "<leader>j", ":m .1<CR>==", opts)
keymap("n", "<leader>k", ":m .-2<CR>==", opts)

-- fix tab
keymap("i", "<S-Tab>", "<C-o>v<", opts)

-- save and quit with ctrl
keymap("n", "<S-q>", ":q<CR>", opts)
keymap("n", "<S-w>", ":w<CR>", opts)

-- source current file
keymap("n", "<leader><leader>s", "<cmd>source %<CR>", opts)

-- use C-c to toggle hlsearch in normal mode
keymap("n", "<C-c>", ":nohlsearch<CR>", opts)

-- netrw
-- keymap("n", "<C-b>", "<Esc>:Lex<CR>:vertical resize 30<cr>", opts)

-- barbar
-- keymap("n", "<S-l>", "<Cmd>BufferNext<CR>", opts)
-- keymap("n", "<S-h>", "<Cmd>BufferPrevious<CR>", opts)
-- NOTE: use this if the barbar isn't installed
keymap("n", "<S-l>", "<cmd>:bnext<CR>", opts)
keymap("n", "<S-h>", "<cmd>:bprev<CR>", opts)

-- reorder buffers
keymap("n", "<C-A-l>", "<Cmd>BufferMoveNext<CR>", opts)
keymap("n", "<C-A-h>", "<Cmd>BufferMovePrevious<CR>", opts)

-- goto buffer in position
keymap("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
keymap("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
keymap("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
keymap("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
keymap("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
keymap("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
keymap("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
keymap("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
keymap("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
keymap("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)

-- close buffer without closing the window
keymap("n", "tc", "<cmd>bp|bd #<CR>", opts)
keymap("n", "tx", "<cmd>bp|bd! #<CR>", opts)

vim.cmd([[
" replace all ocurrences, similar to C-d in vs****
  vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>
]])
