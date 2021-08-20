" KeyMapping

" create <%= foo %> erb tags using Ctrl-k in edit mode
imap <silent> <C-K> <%=  %><Esc>2hi

" create <%= foo %> erb tags using Ctrl-j in edit mode
imap <silent> <C-J> <%  %><Esc>2hi

" seta C-t para rodar teste mais proximo
map <C-t> <ESC>:TestNearest<CR>

" Alt-\ minimiza paineis
nnoremap <silent> « <ESC><C-w>\|
" Alt-= maximiza paineis
nnoremap ≠ <ESC><C-w>=

"" Tabs
nnoremap <S-Tab> gt

"Better window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Navigation with arrows
map ^[OA <up>
map ^[OB <down>
map ^[OC <right>
map ^[OD <left>

" find definition 
nnoremap <Leader>d :FindDefinition<CR>

" configura nerdtree
function! CloseNerdTree()
  if g:NERDTree.IsOpen()
    NERDTreeClose
  else
    NERDTreeFind
  endif
endfunction

" ==== NERD tree
" " Open the project tree and expose current file in the nerdtree with Ctrl-\
command! LocalCloseNerdTree call CloseNerdTree()
nnoremap <silent> <C-\> :LocalCloseNerdTree<cr>

" Autocomplete html tags
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType erb set omnifunc=htmlcomplete#CompleteTags

