vim.pack.add {
  {
    src = 'https://github.com/nvim-mini/mini.diff',
    name = 'mini.diff',
  },
}

require('mini.diff').setup {
  view = {
    style = 'sign',
    signs = { add = '+', change = '~', delete = '-' },
  },
}

local keymap = vim.keymap

local to = '<Cmd>lua MiniDiff.toggle_overlay()<CR>'
keymap.set('n', '<leader>to', to, { desc = 'Git [T]oggle [O]verlay' })
