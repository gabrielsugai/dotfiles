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

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "mason-org/mason.nvim" },
      { "mason-org/mason-lspconfig.nvim" },
    },
    config = function()
      local servers = {
        "ruby_lsp",
        "lua_ls",
        "ts_ls",
        "yamlls",
        "jsonls",
        "bashls",
        "gopls",
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

      -- Aparência dos diagnósticos ---------------------------------------
      vim.diagnostic.config({
        virtual_text = true,
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

      -- Keymaps ativados quando um LSP anexa ao buffer -------------------
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
