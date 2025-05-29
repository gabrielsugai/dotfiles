require("themery").setup({
themes = {"nordic", "tokyonight-night", "rose-pine", "everforest", "moonfly", "tokyodark",
  "catppuccin-frappe", "catppuccin-macchiato", "catppuccin-mocha",
  "kanagawa-wave", "kanagawa-dragon"}, -- Your list of installed colorschemes.
  livePreview = true, -- Apply theme while picking. Default to true.
})

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Disable underline, it's very annoying
        underline = false,
        virtual_text = false,
        -- Enable virtual text, override spacing to 4
        -- virtual_text = {spacing = 4},
        -- Use a function to dynamically turn signs off
        -- and on, using buffer local variables
        signs = true,
        update_in_insert = false
    })
