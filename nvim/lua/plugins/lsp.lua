return {
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- nvim-lspconfig: traz os arquivos lsp/<server>.lua usados pelo vim.lsp
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "mason-org/mason.nvim" },
      { "mason-org/mason-lspconfig.nvim" },
    },
    config = function()
      -- Servers que queremos sempre disponíveis
      local servers = {
        "ruby_lsp", -- Ruby / Rails (Shopify ruby-lsp)
        "lua_ls",   -- Lua (config do próprio Neovim)
        "ts_ls",    -- JavaScript / TypeScript
        "yamlls",   -- YAML
        "jsonls",   -- JSON
        "bashls",   -- Bash / sh
        "gopls",    -- Go
      }

      -- Capabilities turbinadas pelo blink.cmp (autocomplete via LSP).
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok_blink, blink = pcall(require, "blink.cmp")
      if ok_blink then
        capabilities = blink.get_lsp_capabilities(capabilities)
      end

      -- Config padrão aplicada a TODOS os servers.
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- Chaveamento ruby_lsp x solargraph por versão de Ruby -------------
      -- ruby-lsp exige Ruby >= 3.0; projetos legados (ex.: platform, 2.4.10)
      -- usam solargraph, que roda num Ruby moderno e ignora o bundle do
      -- projeto. Cada server só anexa quando a versão do .ruby-version bate.
      local function project_ruby_major(bufnr)
        local name = vim.api.nvim_buf_get_name(bufnr)
        local start = name ~= "" and vim.fs.dirname(name) or vim.fn.getcwd()
        local found = vim.fs.find(".ruby-version", { upward = true, path = start })[1]
        if not found then
          return nil
        end
        local f = io.open(found, "r")
        if not f then
          return nil
        end
        local line = f:read("*l") or ""
        f:close()
        return tonumber(line:match("(%d+)%."))
      end

      -- Sem .ruby-version => assume Ruby moderno (ruby_lsp).
      local function is_legacy_ruby(bufnr)
        local major = project_ruby_major(bufnr)
        return major ~= nil and major < 3
      end

      local function ruby_root(bufnr)
        return vim.fs.root(bufnr, { "Gemfile", ".ruby-version", ".git" }) or vim.fn.getcwd()
      end

      vim.lsp.config("ruby_lsp", {
        root_dir = function(bufnr, on_dir)
          if is_legacy_ruby(bufnr) then
            return -- projeto legado: deixa o solargraph cuidar
          end
          on_dir(ruby_root(bufnr))
        end,
      })

      -- solargraph vem do rbenv (Ruby 3.1.2), fora do Mason: análise estática
      -- roda nesse Ruby moderno e não depende do bundle 2.4 do projeto.
      vim.lsp.config("solargraph", {
        cmd = { vim.fn.expand("~/.rbenv/versions/3.1.2/bin/solargraph"), "stdio" },
        root_dir = function(bufnr, on_dir)
          if not is_legacy_ruby(bufnr) then
            return -- projeto moderno: deixa o ruby_lsp cuidar
          end
          on_dir(ruby_root(bufnr))
        end,
      })

      -- Ajustes específicos por server -----------------------------------
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            -- reconhece o global `vim` para não acusar como erro
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      -- Instala (se faltar) e habilita os servers acima.
      require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_enable = true,
      })

      -- solargraph não é gerenciado pelo Mason: habilita manualmente.
      vim.lsp.enable("solargraph")

      -- Aparência dos diagnósticos ---------------------------------------
      vim.diagnostic.config({
        virtual_text = false, -- inline desligado por padrão (alterna com <leader>dv)
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = { border = "rounded", source = true },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
          },
        },
      })

      -- Liga/desliga o diagnóstico inline (virtual_text) sob demanda.
      vim.keymap.set("n", "<leader>dv", function()
        local enabled = vim.diagnostic.config().virtual_text and true or false
        vim.diagnostic.config({ virtual_text = not enabled })
        vim.notify("Diagnóstico inline: " .. (enabled and "OFF" or "ON"))
      end, { desc = "Diagnostics: alternar inline (virtual_text)" })

      -- Keymaps ativados quando um LSP anexa ao buffer -------------------
      -- Obs.: o Neovim 0.11 já traz por padrão: grn (rename), gra (code
      -- action), grr (references), gri (implementation), K (hover) e [d/]d
      -- (navegar diagnósticos). Os mapeamentos abaixo complementam isso.
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
        callback = function(ev)
          local builtin = require("telescope.builtin")
          local map = function(keys, fn, desc)
            vim.keymap.set("n", keys, fn, { buffer = ev.buf, desc = "LSP: " .. desc })
          end

          map("gd", builtin.lsp_definitions, "Ir para definição")
          map("gD", vim.lsp.buf.declaration, "Ir para declaração")
          map("gi", builtin.lsp_implementations, "Implementações")
          map("gy", builtin.lsp_type_definitions, "Definição de tipo")
          map("<leader>fr", builtin.lsp_references, "Referências (Telescope)")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("<leader>cr", vim.lsp.buf.rename, "Renomear símbolo")
          map("<leader>cd", vim.diagnostic.open_float, "Diagnóstico na linha")
          map("<leader>cf", function()
            vim.lsp.buf.format({ async = true })
          end, "Formatar buffer")
        end,
      })
    end,
  },
}
