return {
  -- See `:help gitsigns`
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    keys = {
      -- gitsigns keymaps
      vim.keymap.set('n', '<leader>ph', ':Gitsigns preview_hunk<CR>', { desc = '[P]review hunk' }),
      vim.keymap.set('n', '<leader>tb', ':Gitsigns toggle_current_line_blame<CR>', { desc = '[T]oggle Current Line [B]lame' }),
    },
  },
}
