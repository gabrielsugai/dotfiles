filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'vim-test/vim-test'
Plug 'tpope/vim-endwise'
Plug 'vim-scripts/tComment'
Plug 'jiangmiao/auto-pairs'
Plug 'dracula/vim', { 'as': 'dracula'  }
Plug 'luochen1990/rainbow'
Plug 'APZelos/blamer.nvim'
Plug 'rking/ag.vim'
Plug 'misterbuckley/vim-definitive'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on    " required

" Plugin settings
colorscheme dracula
let g:airline_theme='dracula'
let g:dracula_colorterm = 0
let g:dracula_italic = 0
let g:rainbow_active = 1
let g:blamer_enabled = 1
let g:blamer_show_in_visual_modes = 1
let g:blamer_show_in_insert_modes = 0
let g:blamer_template = '|<commit-short>| <committer>, <committer-time> • <summary>'
let g:airline_enable_branch = 1
let g:airline_powerline_fonts = 1

" Ativa match de tags e blocos
runtime macros/matchit.vim
