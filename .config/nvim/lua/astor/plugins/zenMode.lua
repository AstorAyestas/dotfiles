return {
  'folke/zen-mode.nvim',
  opts = {},
  config = function()
    local keymap = vim.keymap

    keymap.set('n', '<leader>zm', ":lua require('zen-mode').toggle({ window = { width = .90}})<CR>", { desc = '[Z]en [M]ode' })
  end,
}
