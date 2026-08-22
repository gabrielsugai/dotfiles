-- Alinhamento de colunas em blocos (ex.: campos de struct, tabelas, atribuições).
-- Uso: selecione as linhas no modo visual e pressione:
--   ga  -> alinha pedindo o separador (digite <espaço> para alinhar por espaços)
--   gA  -> mesma coisa, mas com preview ao vivo enquanto ajusta
-- Também funciona em normal mode com um motion/textobject, ex.: gaip (parágrafo).
return {
  "echasnovski/mini.align",
  version = "*",
  keys = {
    { "ga", mode = { "n", "x" }, desc = "Align" },
    { "gA", mode = { "n", "x" }, desc = "Align with preview" },
  },
  opts = {
    mappings = {
      start = "ga",
      start_with_preview = "gA",
    },
  },
}

