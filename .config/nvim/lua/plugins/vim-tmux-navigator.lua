vim.pack.add {
  {
    src = 'https://github.com/christoomey/vim-tmux-navigator',
    name = 'vim-tmux-navigator',
  },
}

local keymap = vim.keymap

keymap.set('n', '<c-h>', '<cmd>TmuxNavigateLeft<cr>')
keymap.set('n', '<c-j>', '<cmd>TmuxNavigateDown<cr>')
keymap.set('n', '<c-k>', '<cmd>TmuxNavigateUp<cr>')
keymap.set('n', '<c-l>', '<cmd>TmuxNavigateRight<cr>')
keymap.set('n', '<c-\\>', '<cmd>TmuxNavigatePrevious<cr>')
