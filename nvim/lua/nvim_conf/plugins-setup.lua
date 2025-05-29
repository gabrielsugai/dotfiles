-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
  use("ThePrimeagen/vim-be-good")

	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

  use 'zaldih/themery.nvim' -- neovim themes manager

  use "catppuccin/nvim"
  -- use('shaunsingh/nord.nvim')
  use('AlexvZyl/nordic.nvim')
  use('neanias/everforest-nvim')
  use('bluz71/vim-moonfly-colors')
  use('tiagovla/tokyodark.nvim')
  use('catppuccin/nvim')
  use('rebelot/kanagawa.nvim')
	use("folke/tokyonight.nvim") -- colorscheme
	use("rose-pine/neovim") -- colorscheme
	use("ayu-theme/ayu-vim") -- colorscheme

	use("folke/tokyonight.nvim") -- colorscheme
	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
	use("szw/vim-maximizer") -- maximizes and restores current window

	use("tpope/vim-surround") -- add, delete, change surroundings
	use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

	use("numToStr/Comment.nvim") -- commenting with gc

	use("nvim-tree/nvim-tree.lua") -- file explorer
	use("nvim-tree/nvim-web-devicons") -- devicons
	use("nvim-lualine/lualine.nvim") -- statusline

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	use("christoomey/vim-tmux-runner")
	use("vim-ruby/vim-ruby")
	use("tpope/vim-rails")
	use("vim-test/vim-test")
	use("thoughtbot/vim-rspec")
  use("theprimeagen/harpoon")
  use "RRethy/nvim-treesitter-endwise"

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	--lsp config

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
  use("APZelos/blamer.nvim") -- git blame

  use("folke/flash.nvim") -- flash

  use {
    'andymass/vim-matchup',
    setup = function()
      -- may set any options here
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  }

  if packer_bootstrap then
    require("packer").sync()
  end
end)
