set nu " Set numerial lines 

" Setoff sound alerts
set belloff=all
" Set 2 spaces for tab
set tabstop=2
set shiftwidth=2
set shiftround

" Set ruby identy
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2

" Load plugins and settings
so ~/.vim/plugins.vim
so ~/.vim/settings.vim
syntax enable
