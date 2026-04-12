vim.pack.add { 'https://github.com/saghen/blink.indent' }
local indent = require 'blink.indent'

indent.setup {}

vim.g.indent_guide = false
vim.keymap.set('n', '<leader>ti', function() indent.enable(not indent.is_enabled()) end, { desc = '[T]oggle [I]ndent' })
