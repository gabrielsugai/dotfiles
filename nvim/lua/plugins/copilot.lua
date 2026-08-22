return {
  "github/copilot.vim",
  event = "InsertEnter",
  init = function()
    -- O <Tab> é controlado pelo blink.cmp (ver plugins/blink-cmp.lua),
    -- então desativamos o mapa padrão do Copilot para evitar conflito.
    vim.g.copilot_no_tab_map = true
  end,
  config = function()
    vim.defer_fn(function()
      vim.cmd("Copilot enable")
    end, 100)
  end,
}
