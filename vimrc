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

" Set ruby identy
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2

" Load plugins and settings
so ~/.vim/plugins.vim
so ~/.vim/settings.vim
syntax enable
