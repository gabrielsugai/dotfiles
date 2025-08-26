return {
  "github/copilot.vim",
  event = "InsertEnter",
  config = function()
    vim.defer_fn(function()
      vim.cmd("Copilot enable")
    end, 100)
  end,
}
