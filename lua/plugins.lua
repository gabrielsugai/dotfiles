require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true
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

-- Neovim coloscheme
require('tokyonight').setup { style = 'darker' }
require('tokyonight').load()

-- Lualine colorscheme
require('lualine').setup { options = { theme = 'tokyonight' } }

-- Plugins settings
vim.g['blamer_enabled'] = 1
vim.g['blamer_show_in_visual_modes'] = 1
vim.g['blamer_show_in_insert_modes'] = 0
vim.g['blamer_template'] = '|<commit-short>| <committer>, <committer-time> • <summary>'
vim.g['airline_enable_branch'] = 1
vim.g['airline_powerline_fonts'] = 1
vim.g['rspec_command'] = "VtrSendCommandToRunner! bundle exec rspec {spec}"

