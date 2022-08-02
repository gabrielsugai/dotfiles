" KeyMapping

set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace

"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

" create <%= foo %> erb tags using Ctrl-k in edit mode
imap <silent> <C-K> <%=  %><Esc>2hi

" create <%= foo %> erb tags using Ctrl-j in edit mode
imap <silent> <C-J> <%  %><Esc>2hi

" Run minitest specs
nnoremap <Leader>mt <ESC>:TestNearest<CR>

" copy and paste
" <space>y + motion ex: <space>yw
:vmap <S-y> "*y
nnoremap <Leader>p "+p<CR>

" vim-rspec mappings
nnoremap <Leader>rs :call RunCurrentSpecFile()<CR>
nnoremap <Leader>rn :call RunNearestSpec()<CR>
nnoremap <Leader>rl :call RunLastSpec()<CR>
nnoremap <Leader>ra :call RunAllSpecs()<CR>

" Space-\ minimiza paineis
nnoremap <silent> <Leader>\ <ESC><C-w>\|
" Space-= maximiza paineis
nnoremap <silent> <Leader>= <ESC><C-w>=

" Open files from fzf
nnoremap <silent> <C-p> <ESC>:Files<CR>

nnoremap <silent> <Leader>r <ESC>:R<CR>

" Open live grep
nnoremap <leader>f <cmd>Telescope live_grep<cr>

"" Tabs
nnoremap <S-Tab> gt

" Don't allow any default key-mappings.
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" Navigation with arrows
map ^[OA <up>
map ^[OB <down>
map ^[OC <right>
map ^[OD <left>

" find definition 
nnoremap <Leader>d :FindDefinition<CR>
" find definition and open in a vertical split
nnoremap <Leader>v :VFindDefinition<CR>

" move select text forward and backward
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" toggle git blamer
nnoremap <Leader>b :BlamerToggle<CR>
" Blamer disable by default
let g:blamer_enabled = 0

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" configura nerdtree
nnoremap <silent> <C-\> :NvimTreeFindFileToggle<cr>

" Autocomplete html tags
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType erb set omnifunc=htmlcomplete#CompleteTags

