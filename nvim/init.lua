require("config.lazy")
require("core.keymaps")
require("core.options")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "snacks_picker_list",
  callback = function()
    local map = function(lhs, cmd)
      vim.keymap.set("n", lhs, function()
        local picker = require("snacks.pickers.picker").get_current()
        if picker then
          picker:open({ cmd = cmd })
        end
      end, { buffer = true })
    end

    map("t", "tabedit")   -- abre em nova aba
    map("s", "vsplit")    -- abre em vertical split
  end,
})
