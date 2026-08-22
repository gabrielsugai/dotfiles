return {
  "nvim-lualine/lualine.nvim",

  config = function()
    local lualine = require("lualine")
    -- local lualine_nightfly = require("lualine.themes.tokyodark")

    lualine.setup({
      options = {
        theme = 'ayu',
        -- theme = ,
      },
      sections = {
        lualine_x = {
          function ()
            if vim.v.hlsearch == 0 or vim.fn.getreg('/') == '' then
              return ''
            end

            local result = vim.fn.searchcount({ recompute = 1, maxcount = -1, timeout = 500 })

            if next(result) == nil or result.total == 0 then
              return ''
            end

            return string.format('🔍 [%d/%d]', result.current, result.total)
          end, 'encoding', 'fileformat', 'filetype' },
      },
    })
  end
}
