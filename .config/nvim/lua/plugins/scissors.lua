vim.pack.add {
  {
    src = 'https://github.com/chrisgrieser/nvim-scissors',
    name = 'nvim-scissors',
  },
}

local scissors = require 'nvim-scissors'
scissors.setup {
  snippetDir = '~/dotfiles/.config/nvim/snippets',
}

vim.keymap.set('n', '<leader>nn', function() scissors.editSnippet() end, { desc = '󰩫 Edit snippets' })

vim.keymap.set({ 'n', 'x' }, '<leader>na', function() scissors.addNewSnippet() end, { desc = '󰩫 Add snippets' })
