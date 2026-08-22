return {
  "nvim-treesitter/nvim-treesitter",
  -- master foi arquivado e não suporta Neovim 0.12; main é a reescrita p/ 0.12+.
  branch = "main",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    local ts = require("nvim-treesitter")

    -- Instala/atualiza parsers em stdpath("data")/site (default), que está no rtp.
    ts.setup()

    local ensure_installed = {
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
    }

    -- install() é assíncrono; só instala o que ainda falta.
    local installed = ts.get_installed()
    local to_install = vim.tbl_filter(function(lang)
      return not vim.tbl_contains(installed, lang)
    end, ensure_installed)
    if #to_install > 0 then
      ts.install(to_install)
    end

    -- No main não há módulo de highlight/indent: habilita via core do Neovim.
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
      callback = function(args)
        -- kulala gerencia o próprio parser p/ http/rest.
        local ft = vim.bo[args.buf].filetype
        if ft == "http" or ft == "rest" then
          return
        end

        -- highlight (no-op se não houver parser p/ o filetype)
        local ok = pcall(vim.treesitter.start, args.buf)
        if ok then
          -- indentação baseada em treesitter (experimental no main)
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
