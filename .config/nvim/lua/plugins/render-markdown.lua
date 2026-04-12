vim.pack.add {
  {
    src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim',
    name = 'render-markdown',
  },
}
require('render-markdown').setup {
  ft = { 'markdown' },
}
