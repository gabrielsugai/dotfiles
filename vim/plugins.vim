filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'vim-test/vim-test'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-endwise'
Plug 'vim-scripts/tComment'
Plug 'jiangmiao/auto-pairs'
Plug 'dracula/vim', { 'as': 'dracula'  }
Plug 'APZelos/blamer.nvim'
Plug 'rking/ag.vim'
Plug 'misterbuckley/vim-definitive'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ngmy/vim-rubocop'

" All of your Plugins must be added before the following line
call plug#end()

filetype plugin indent on    " required

" Plugin settings
colorscheme dracula
let g:airline_theme='dracula'
" disable vim background color
" let g:dracula_colorterm = 0
let g:dracula_italic = 0
let g:blamer_enabled = 1
let g:blamer_show_in_visual_modes = 1
let g:blamer_show_in_insert_modes = 0
let g:blamer_template = '|<commit-short>| <committer>, <committer-time> • <summary>'
let g:airline_enable_branch = 1
let g:airline_powerline_fonts = 1
let g:rspec_command = "VtrSendCommandToRunner! bundle exec rspec {spec}"

" Ativa match de tags e blocos
runtime macros/matchit.vim
