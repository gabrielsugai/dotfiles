require("flash").setup({
  labels = "asdfghjklqwertyuiopzxcvbnm", -- Custom label order
  search = {
    mode = "exact", -- "exact", "fuzzy", or "search"
    incremental = true, -- show matches as you type
  },
  jump = {
    autojump = true, -- jump automatically if there is only one match
  },
  highlight = {
    backdrop = true, -- highlight background matches
    matches = true,  -- highlight current matches
  },
  modes = {
    char = {
      enabled = true,
      keys = { "f", "F", "t", "T" }
    },
    search = {
      enabled = true,
      highlight = true,
    }
  }
})

vim.keymap.set({"n", "x", "o"}, "s", function() require("flash").jump() end, {desc = "Flash Jump"})
vim.keymap.set({"n", "x", "o"}, "S", function() require("flash").treesitter() end, {desc = "Flash Treesitter"})
vim.keymap.set({"o"}, "r", function() require("flash").remote() end, {desc = "Remote Flash"})
vim.keymap.set({"o", "x"}, "R", function() require("flash").treesitter_search() end, {desc = "Treesitter Search"})
