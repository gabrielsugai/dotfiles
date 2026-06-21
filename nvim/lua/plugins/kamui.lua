return {
  "gabrielsugai/kamui.nvim",
  dir = "~/gabriel/kamui.nvim",
  dev = true,
  dependencies = { "christoomey/vim-tmux-navigator" },
    init = function()
        vim.g.tmux_navigator_no_mappings = 1
    end,
  opts = {
    navigate = {
      -- normal navigation: let vim-tmux-navigator decide between nvim/tmux.
      -- the focused behavior (jump to the tmux pane) is built in.
      default = function(dir)
        vim.cmd(({
          left = "TmuxNavigateLeft",
          down = "TmuxNavigateDown",
          up = "TmuxNavigateUp",
          right = "TmuxNavigateRight",
        })[dir])
      end,
    },
  },
  keys = {
    { "<leader>z", function() require("kamui").toggle() end, desc = "Focus/unfocus window" },
    { "<C-h>", function() require("kamui").navigate("left") end },
    { "<C-j>", function() require("kamui").navigate("down") end },
    { "<C-k>", function() require("kamui").navigate("up") end },
    { "<C-l>", function() require("kamui").navigate("right") end },
  },
}

