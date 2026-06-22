-- Padrões de exclusão das buscas do Telescope, separados em grupos.
-- São Lua patterns aplicados ao caminho (não globs): %. = ponto literal,
-- ^ = início do caminho, $ = fim do caminho.
local M = {}

-- Sempre ignorados (dependências, artefatos gerados, db gerado).
M.base = {
  -- controle de versão / dependências
  "^%.git/",
  "node_modules/",
  "vendor/",
  "%.bundle/",
  "gems",
  -- artefatos e arquivos gerados
  "tmp/",
  "log/",
  "coverage/",
  "public/",
  "test_packaged",
  "%.min%.js$",
  "%.lock$",
  -- db gerado
  "db/structure%.sql$",
  "db/schema%.rb$",
}

-- Padrões de teste: ignorados nas buscas normais, liberados na busca "com testes".
M.tests = {
  "^spec/",
  "/spec/",
  "^test/",
  "/test/",
  "_spec%.rb$",
  "_test%.rb$",
}

-- Lista usada por padrão nas buscas (base + testes).
M.all = vim.list_extend(vim.list_extend({}, M.base), M.tests)

return M
