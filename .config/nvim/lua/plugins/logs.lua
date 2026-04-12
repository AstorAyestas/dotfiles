vim.pack.add {
  {
    src = 'https://github.com/chrisgrieser/nvim-chainsaw',
    name = 'nvim-chainsaw',
  },
}

local chainsaw = require 'chainsaw'
chainsaw.setup()

local keymap = vim.keymap

keymap.set({ 'n', 'x' }, '<leader>pc', function() chainsaw.removeLogs() end, { desc = '󰅗 [P]rint [C]leanup' })

keymap.set({ 'n', 'x' }, '<leader>po', function() chainsaw.objectLog() end, { desc = '⬟ [P]rint [O]bject' })

keymap.set({ 'n', 'x' }, '<leader>pv', function() chainsaw.variableLog() end, { desc = '󰅗 [P]rint [V]ariable' })

keymap.set({ 'n', 'x' }, '<leader>pt', function() chainsaw.typeLog() end, { desc = '󰅗 [P]rint [T]ype' })

keymap.set({ 'n', 'x' }, '<leader>pm', function() chainsaw.messageLog() end, { desc = '󰅗 [P]rint [M]essage' })
