vim.g.mapleader = " "

local keymap = vim.keymap

-- general
keymap.set("n", "o", "o<ESC>")
keymap.set("n", "O", "O<ESC>")
keymap.set("n", "<C-s>", ":w<CR>")

-- splits
keymap.set("n", "<leader>s/", "<C-w>v") -- vertical split
keymap.set("n", "<leader>s*", "<C-w>s") -- horizontal split
keymap.set("n", "<leader>s-", "<C-w>=") -- equal width
keymap.set("n", "<leader>sñ", ":close<CR>") -- close split

keymap.set("n", "<C-S-Left>", ":wincmd h<CR>") --move to left split
keymap.set("n", "<C-S-Right>", ":wincmd l<CR>") --move to right split
keymap.set("n", "<C-S-Down>", ":wincmd j<CR>") --move to down split
keymap.set("n", "<C-S-Up>", ":wincmd k<CR>") --move to up split

-- tabs
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- prev tab
keymap.set("n", "<leader>tñ", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tñl", ":tabo<CR>") -- close all other tabs

-- nvim tree
keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>")
keymap.set("n", "<leader>q", ":NvimTreeClose<CR>")
keymap.set("n", "<leader>l", ":NvimTreeFindFile<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")

-- trouble
keymap.set("n", "<leader>d", ":TroubleToggle<cr>")
