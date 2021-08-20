filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call plug#begin('~/.vim/plugged')
" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'
Plug 'preservim/nerdtree'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'vim-test/vim-test'
Plug 'tpope/vim-endwise'
Plug 'vim-scripts/tComment'
Plug 'jiangmiao/auto-pairs'
Plug 'dracula/vim', { 'name': 'dracula'  }
Plug 'luochen1990/rainbow'
Plug 'APZelos/blamer.nvim'
Plug 'kien/ctrlp.vim'
Plug 'misterbuckley/vim-definitive'

" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on    " required

" Plugin settings
colorscheme dracula
let g:dracula_colorterm = 0
let g:dracula_italic = 0
let g:rainbow_active = 1
let g:blamer_enabled = 1
let g:blamer_show_in_visual_modes = 1
let g:blamer_show_in_insert_modes = 0
let g:blamer_template = '|<commit-short>| <committer>, <committer-time> • <summary>'

" Ativa match de tags e blocos
runtime macros/matchit.vim
