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
-- keymap.set("i", "<C-U>", "<%=  %><Esc>2hi")

-- create <%= foo %> erb tags using Ctrl-j in edit mode
-- keymap.set("i", "<C-I>", "<%  %><Esc>2hi")

-- copy and paste
keymap.set("v", "<S-y>", '"*y')

--nnoremap <Leader>p "+p<CR>
-- move up and down
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- selection indent
keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("x", "<leader>p", [["_dP]])
keymap.set("n", "Q", "<nop>")
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- keymap.set("n", "<leader>ff", "<C-^>") -- alternate buffers
keymap.set("n", "<leader>tt", ":Themery<CR>") -- alternate buffers

keymap.set("n", "<leader>ft", ":set filetype=") -- set filetype helper


-- Maximizar painel atual (vertical)
-- keymap.set("n", "<leader>\\", "<C-w>|", {
--   desc = "Maximize current split"
-- })

-- Equalizar todos os painéis
-- keymap.set("n", "<leader>=", "<C-w>=", {
--   desc = "Equalize splits"
-- })

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

keymap.set("n", "<leader>b", ":BlamerToggle<CR>") -- toggle git blame

keymap.set("n", "<leader>gb", ":Telescope git_bcommits<CR>") -- open blame history

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<c-p>", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- escape hatch: buscar TUDO (inclui testes, db, ignorados e ocultos)
keymap.set("n", "<leader>fa", function()
  require("telescope.builtin").find_files({
    hidden = true,
    no_ignore = true,
    file_ignore_patterns = {},
  })
end, { desc = "Find files (sem filtros)" })
keymap.set("n", "<leader>fA", function()
  require("telescope.builtin").live_grep({
    additional_args = { "--hidden", "--no-ignore" },
    file_ignore_patterns = {},
  })
end, { desc = "Live grep (sem filtros)" })

-- incluir testes: mantém os demais filtros, mas mostra specs/tests
-- (ex.: achar um model e o spec dele de uma vez)
keymap.set("n", "<leader>ff", function()
  require("telescope.builtin").find_files({
    file_ignore_patterns = require("core.search").base,
  })
end, { desc = "Find files (inclui testes)" })
keymap.set("n", "<leader>fg", function()
  require("telescope.builtin").live_grep({
    file_ignore_patterns = require("core.search").base,
  })
end, { desc = "Live grep (inclui testes)" })

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
