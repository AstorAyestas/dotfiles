return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('refactoring').setup()
    local keymap = vim.keymap
    keymap.set('n', '<leader>pf', function()
      require('refactoring').debug.printf { below = false }
    end, { desc = '[P]rint [F]unction' })
    keymap.set({ 'x', 'n' }, '<leader>pv', function()
      require('refactoring').debug.print_var()
    end, { desc = '[P]rint [V]ar' })
    keymap.set('n', '<leader>pc', function()
      require('refactoring').debug.cleanup {}
    end, { desc = '[P]rint [C]leanup' })
  end,
}
