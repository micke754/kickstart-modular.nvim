return {
  {
    'R-nvim/R.nvim',
    config = function()
      -- Create a table with the options to be passed to setup()
      local opts = {
        R_args = { '--quiet', '--no-save' },
        R_app = 'radian',
        R_cmd = 'R',
        hl_term = false,
        bracketed_paste = true,
        hook = {
          on_filetype = function()
            -- This function will be called at the FileType event
            -- of files supported by R.nvim. This is an
            -- opportunity to create mappings local to buffers.
            vim.api.nvim_buf_set_keymap(0, 'n', '<C-e>', '<Plug>RDSendLine', {})
            vim.api.nvim_buf_set_keymap(0, 'i', '<C-e>', '<Esc><Plug>RDSendLine', {})
            vim.api.nvim_buf_set_keymap(0, 'v', '<Enter>', '<Plug>RSendSelection', {})
            vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>fr', ':RFormat<Esc>', {})
            vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>fr', ':RFormat<Esc>', {})
          end,
        },
        min_editor_width = 72,
        rconsole_width = 78,
        disable_cmds = {
          'RClearConsole',
          'RCustomStart',
          'RSPlot',
          'RSaveClose',
        },
      }
      -- Check if the environment variable "R_AUTO_START" exists.
      -- If using fish shell, you could put in your config.fish:
      -- alias r "R_AUTO_START=true nvim"
      if vim.env.R_AUTO_START == 'true' then
        opts.auto_start = 1
        opts.objbr_auto_start = true
      end
      require('r').setup(opts)
    end,
    lazy = false,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'markdown', 'markdown_inline', 'r', 'rnoweb' },
      }
    end,
  },
  { 'R-nvim/cmp-r' },
}
