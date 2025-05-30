return {
  "nvim-lualine/lualine.nvim",

  config = function()
    local lualine = require("lualine")
    local lualine_nightfly = require("lualine.themes.tokyodark")

    lualine.setup({
      options = {
        theme = lualine_nightfly,
      },
    })
  end
}
