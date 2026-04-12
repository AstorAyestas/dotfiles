local keymap = vim.keymap

vim.pack.add {
  {
    src = 'https://github.com/nvim-mini/mini.files',
    name = 'mini.files',
  },
}

require('mini.files').setup()
keymap.set('n', '<leader>fc', ":lua require('mini.files').open(vim.api.nvim_buf_get_name(0), true)<CR>", { desc = '[F]ile Explorer [C]urrent Buffer' })
keymap.set('n', '<leader>fe', ":lua require('mini.files').open()<CR>", { desc = '[F]ile [E]xplorer' })
