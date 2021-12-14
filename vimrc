" Leader
let mapleader = " "

set nocompatible
set nu " Set numerial lines 
set termguicolors

" Setoff sound alerts
set belloff=all
" Set 2 spaces for tab
set tabstop=2
set shiftwidth=2
set shiftround
set colorcolumn=80
set noswapfile

" Set ruby identy
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2

" Enable spellchecking for Markdown
autocmd FileType markdown setlocal spell

" Load plugins and settings
so ~/.vim/plugins.vim
so ~/.vim/settings.vim
syntax enable

" Default to filename searches
let g:ctrlp_by_filename = 1

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

set encoding=utf8
