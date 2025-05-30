local opt = vim.opt -- conciseness

opt.guicursor = ""
opt.swapfile = false
opt.backup = false
opt.colorcolumn = "80,120"

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-") -- set slash as part of a word

vim.g['blamer_enabled'] = 0
vim.g['blamer_show_in_visual_modes'] = 1
vim.g['blamer_show_in_insert_modes'] = 0
vim.g['blamer_delay'] = 500
vim.g['blamer_template'] = '|<commit-short>| <author>, <committer-time> • <summary>'
