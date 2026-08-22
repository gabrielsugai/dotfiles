return {
    "zaldih/themery.nvim",
    lazy = false,
    dependencies = {
	 "zaldih/themery.nvim",
	 "catppuccin/nvim",
	 "AlexvZyl/nordic.nvim",
	 "neanias/everforest-nvim",
	 "bluz71/vim-moonfly-colors",
	 "tiagovla/tokyodark.nvim",
	 "catppuccin/nvim",
	 "rebelot/kanagawa.nvim",
	 "folke/tokyonight.nvim",
	 "rose-pine/neovim",
    "Shatur/neovim-ayu",
    },
  config = function()
    require("themery").setup({
      themes = {
        "nordic",
        "tokyonight-night",
        "rose-pine",
        "everforest",
        "moonfly",
        "tokyodark",
        "catppuccin-frappe",
        "catppuccin-macchiato",
        "catppuccin-mocha",
        "kanagawa-wave",
        "kanagawa-dragon",
        "ayu-dark",
      }, -- Your list of installed colorschemes.
      livePreview = true, -- Apply theme while picking. Default to true.
    })
  end
}
