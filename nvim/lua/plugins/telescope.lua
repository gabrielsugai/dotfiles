return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make", -- compila a lib nativa (gera build/libfzf)
    },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    telescope.setup({
      extensions = {
        fzf = {
          fuzzy = true,                     -- false will only do exact matching
          override_generic_sorter = true,   -- usa o sorter do fzf nos pickers genéricos
          override_file_sorter = true,      -- usa o sorter do fzf na busca de arquivos
          case_mode = "smart_case",         -- or "ignore_case" or "respect_case"
          -- com isso, espaço = "E" entre termos: "app class" casa com app/class.rb
        }
      },
      defaults = {
        -- Exclusões definidas em core/search.lua (base + testes).
        -- <leader>ff / <leader>fg  → incluem testes (mantêm os outros filtros)
        -- <leader>fa / <leader>fA  → buscam tudo, sem nenhum filtro
        file_ignore_patterns = require("core.search").all,
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
          },
        },
      },
    })

    -- precisa vir depois do setup; usa a lib nativa compilada pelo build acima
    telescope.load_extension("fzf")
  end,

}
