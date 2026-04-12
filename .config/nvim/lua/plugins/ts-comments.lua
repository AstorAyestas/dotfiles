vim.pack.add {
  {
    src = 'https://github.com/folke/ts-comments.nvim',
    name = 'ts-comments',
  },
}

require('ts-comments').setup()
