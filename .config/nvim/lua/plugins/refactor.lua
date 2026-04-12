vim.pack.add {
  {
    src = 'https://github.com/ThePrimeagen/refactoring.nvim',
    name = 'refactoring',
  },
}

local refactor = require 'refactoring'
refactor.setup()

vim.keymap.set({ 'n', 'x' }, '<leader>rr', function() refactor.select_refactor() end, { desc = '[R]refactor selector' })
