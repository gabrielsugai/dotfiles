vim.g.mapleader = " "

local keymap = vim.keymap -- conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- create <%= foo %> erb tags using Ctrl-k in edit mode
keymap.set("i", "<C-U>", "<%=  %><Esc>2hi")

-- create <%= foo %> erb tags using Ctrl-j in edit mode
keymap.set("i", "<C-I>", "<%  %><Esc>2hi")

-- copy and paste
keymap.set("v", "<S-y>", '"*y')

--nnoremap <Leader>p "+p<CR>
-- move up and down
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- Run tests
-- Run minitest specs
keymap.set("n", "<Leader>mt", "<ESC>:TestNearest<CR>") -- list available help tags

-- vim-rspec mappings
keymap.set("n", "<Leader>rs", ":call RunCurrentSpecFile()<CR>")
keymap.set("n", "<Leader>rn", ":call RunNearestSpec()<CR>")
keymap.set("n", "<Leader>rl", ":call RunLastSpec()<CR>")
keymap.set("n", "<Leader>ra", ":call RunAllSpecs()<CR>")

-- rails
-- Open test file
keymap.set("n", "<Leader>r", "<ESC>:R<CR>")

-- Open schema creation table
keymap.set("n", "<Leader>a", "<ESC>:A<CR>")

-- Don't allow any default key-mappings.
vim.g.tmux_navigator_no_mappings = 1

keymap.set("n", "<c-h>", ":TmuxNavigateLeft<cr>")
keymap.set("n", "<c-j>", ":TmuxNavigateDown<cr>")
keymap.set("n", "<c-k>", ":TmuxNavigateUp<cr>")
keymap.set("n", "<c-l>", ":TmuxNavigateRight<cr>")
