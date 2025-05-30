return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  dependencies = { 
    "RRethy/nvim-treesitter-endwise"
  },

  config = function()
    treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
      -- enable syntax highlighting
      highlight = {
        enable = true,
      },
      -- enable indentation
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = { enable = true },
      -- ensure these language parsers are installed
      ensure_installed = {
        "ruby",
        "json",
        "javascript",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
      },
      -- auto install above language parsers
      auto_install = true,
      endwise = {
        enable = true,
      },
    }
  )

end
}
