local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- set leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "

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

-- keep cursor centered
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- save with shift
keymap("n", "<S-w>", ":w<CR>", opts)

-- use C-c to toggle hlsearch in normal mode
keymap("n", "<C-c>", ":nohlsearch<CR>", opts)

-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- buffers
keymap("n", "tc", "<cmd>bp|bd #<CR>", opts)
keymap("n", "tx", "<cmd>bp|bd! #<CR>", opts)
keymap("n", "<S-l>", "<cmd>bn<CR>", opts)
keymap("n", "<S-h>", "<cmd>bp<CR>", opts)

-- nvim-tree
keymap("n", "<C-b>", "<cmd>NvimTreeFindFileToggle<CR>", opts)
