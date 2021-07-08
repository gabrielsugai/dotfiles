set nocompatible
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'gruvbox-community/gruvbox'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'vim-test/vim-test'
Plugin 'tpope/vim-endwise'
Plugin 'vim-scripts/tComment'
Plugin 'misterbuckley/vim-definitive'
Plugin 'jiangmiao/auto-pairs'
Plugin 'dracula/vim', { 'name': 'dracula'  }
Plugin 'luochen1990/rainbow'
Plugin 'APZelos/blamer.nvim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Plugin settings
colorscheme dracula
let g:dracula_italic = 0
let g:rainbow_active = 1
let g:blamer_enabled = 1
let g:blamer_show_in_visual_modes = 1
let g:blamer_show_in_insert_modes = 0
let g:blamer_template = '|<commit-short>| <committer>, <committer-time> • <summary>'
let g:blamer_delay = 500

set runtimepath^=~/.vim/bundle/ctrlp.vim

" Ativa match de tags e blocos
runtime macros/matchit.vim
