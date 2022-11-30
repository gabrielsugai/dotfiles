filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'tpope/vim-fugitive'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'vim-test/vim-test'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-endwise'
Plug 'vim-scripts/tComment'
Plug 'jiangmiao/auto-pairs'
Plug 'APZelos/blamer.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ngmy/vim-rubocop'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'dracula/vim', { 'as': 'dracula'  }
" Plug 'joshdick/onedark.vim'
" Plug 'sainnhe/sonokai'
call plug#end()

filetype plugin indent on    " required

" Plugin settings

lua << EOF
  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true
      }
    }

  require('tokyonight').setup {
    style = 'darker'
    }
  require('tokyonight').load()

  require"nvim-treesitter.highlight".set_custom_captures {
    -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
    ["symbol"] = "TSAttribute"
    }

  require('lualine').setup {
    options = {
      theme = 'tokyonight'
      }
    }

  require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "s", action = "vsplit" },
        { key = "t", action = "tabnew" },
        },
      },
    },
  renderer = {
    group_empty = true,
    },
  filters = {
    dotfiles = true,
    }
  })
EOF

let g:blamer_enabled = 1
let g:blamer_show_in_visual_modes = 1
let g:blamer_show_in_insert_modes = 0
let g:blamer_template = '|<commit-short>| <committer>, <committer-time> • <summary>'
let g:airline_enable_branch = 1
let g:airline_powerline_fonts = 1
let g:rspec_command = "VtrSendCommandToRunner! bundle exec rspec {spec}"

" Ativa match de tags e blocos
runtime macros/matchit.vim
