return {
  'preservim/vimux',
  --vimux keymap
  vim.keymap.set('n', '<leader>vp', ':VimuxPromptCommand<CR>', { desc = '[V]imux [P]rompt Command' }),
  vim.keymap.set('n', '<leader>vl', ':VimuxRunLastCommand<CR>', { desc = '[V]imux [L]ast Command' }),
  vim.keymap.set('n', '<leader>vq', ':VimuxCloseRunner<CR>', { desc = '[V]imux [Q]uit Command' }),
  vim.keymap.set('n', '<leader>vz', ':VimuxZoomRunner<CR>', { desc = '[V]imux [Z]oom Runner' }),
  vim.keymap.set('n', '<leader>lg', ":call VimuxRunCommand('lazygit', 1)<CR>:VimuxZoomRunner<CR>", { desc = '[L]azy [G]it' }),
}
