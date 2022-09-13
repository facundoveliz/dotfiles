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

-- buffers
keymap("n", "<S-l>", "<cmd>:bnext<CR>", opts)
keymap("n", "<S-h>", "<cmd>:bprev<CR>", opts)
-- close buffer without closing the window
keymap("n", "tc", "<cmd>bp|bd #<CR>", opts)
keymap("n", "tx", "<cmd>bp|bd! #<CR>", opts)

-- fix tab
keymap("i", "<S-Tab>", "<C-o>v<", opts)

-- nvim tree
keymap("n", "<C-b>", ":NvimTreeToggle<CR>", opts)

-- color
keymap("n", "<leader>cc", ":ColorToggle<CR>", opts)

-- save and quit with ctrl
keymap("n", "<S-q>", ":q<CR>", opts)
keymap("n", "<S-w>", ":w<CR>", opts)

-- use ESC to exit insert mode in :term
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

-- source current file
keymap("n", "<leader><leader>s", "<cmd>source %<CR>", opts)

-- use C-c to toggle hlsearch in normal mode
keymap("n", "<C-c>", ":nohlsearch<CR>", opts)

vim.cmd([[
" replace all ocurrences, similar to C-d in vs****
  vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>
]])
