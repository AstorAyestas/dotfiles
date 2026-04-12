vim.pack.add {
  {
    src = 'https://github.com/nvim-mini/mini.ai',
    name = 'mini.ai',
  },
}

require('mini.ai').setup { n_lines = 500 }
