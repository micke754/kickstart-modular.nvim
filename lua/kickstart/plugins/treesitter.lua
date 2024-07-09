return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      local config = require 'nvim-treesitter.configs'
      config.setup {
        ensure_installed = {
          'bash',
          'c',
          'diff',
          'html',
          'lua',
          'luadoc',
          'markdown',
          'vim',
          'vimdoc',
          'nix',
          'markdown',
          'markdown_inline',
          'r',
          'rnoweb',
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
    dependencies = {
      -- NOTE: additional parser
      { 'nushell/tree-sitter-nu' },
    },
    build = ':TSUpdate',
  },
}
