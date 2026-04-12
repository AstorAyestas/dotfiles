vim.pack.add {
  {
    src = 'https://github.com/chrisgrieser/nvim-rip-substitute',
    name = 'nvim-rip-substitute',
  },
}

local rip = require 'rip-substitute'
rip.setup {}

vim.keymap.set({ 'n', 'x' }, '<leader>fs', function() rip.sub() end, { desc = '[F]ind [S]ubstitute text' })
