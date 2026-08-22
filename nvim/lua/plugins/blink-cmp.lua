-- Autocomplete (blink.cmp) integrado ao LSP nativo.
-- Atalhos do preset "default": <C-space> abre, <C-y> aceita, <C-e> fecha,
-- <C-n>/<C-p> navegam, <C-k> assinatura. O <Tab>: aceita o item do blink se o
-- menu estiver aberto; senão aceita a sugestão do Copilot, se houver; senão
-- faz o fallback normal (indentação/snippet).
return {
  "saghen/blink.cmp",
  version = "1.*",
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  opts = {
    keymap = {
      preset = "default",
      ["<Tab>"] = {
        "accept",
        function()
          local suggestion = vim.fn["copilot#GetDisplayedSuggestion"]()
          if suggestion and suggestion.text ~= "" then
            vim.api.nvim_feedkeys(vim.fn["copilot#Accept"](""), "i", true)
            return true
          end
        end,
        "fallback",
      },
    },
    appearance = { nerd_font_variant = "mono" },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
    },
    signature = { enabled = true },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
