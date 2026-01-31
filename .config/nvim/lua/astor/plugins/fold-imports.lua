return {
  'dmtrKovalenko/fold-imports.nvim',
  opts = {},
  event = 'BufRead',
  keys = {
    {
      '<leader>tfi',
      '<cmd> FoldImportsToggle <cr>',
      desc = '[T]oggle [F]old [I]mport',
    },
  },
}
