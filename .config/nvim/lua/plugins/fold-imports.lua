vim.pack.add {
  {
    src = 'https://github.com/dmtrKovalenko/fold-imports.nvim',
    name = 'fold_imports',
  },
}

local fold = require 'fold_imports'
fold.setup()

vim.keymap.set('n', '<leader>tfi', '<cmd> FoldImportsToggle <cr>', { desc = '[T]oggle [F]old [I]mport' })
