-- Shorten function name
local keymap = vim.keymap.set

-- Silent keymap option
-- local opts = { silent = true }
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Reload configs
opts.desc = "Reload luafile"
keymap("n", "<leader>r", "<cmd>luafile%<CR>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>noh<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>bdelete!<CR><cmd>:bnext<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Insert lines ==== or --- normal_mode
keymap("n", "\\a=", "<ESC>20a=<ESC>a", opts)
keymap("n", "\\a-", "<ESC>20a-<ESC>a", opts)
keymap("n", "\\<S-a>=", "<ESC>80A=<ESC>80|Dj0", opts)
keymap("n", "\\<S-a>-", "<ESC>80A-<ESC>80|Dj0", opts)
keymap("n", "\\i=", "<ESC>20i=<ESC>a", opts)
keymap("n", "\\i-", "<ESC>20i-<ESC>a", opts)
keymap("n", "\\<S-i>=", "<ESC>80I=<ESC>80|Dj0", opts)
keymap("n", "\\<S-i>-", "<ESC>80I-<ESC>80|Dj0", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
