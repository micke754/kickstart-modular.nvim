return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.stylua,
        -- 'styler' package should be installed in library used by `R` command.
        null_ls.builtins.formatting.styler,
      },
    }

    vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, {})
  end,
  lazy = false
}
