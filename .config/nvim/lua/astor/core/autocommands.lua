-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- AUTO-CLEANUP
vim.api.nvim_create_autocmd('FocusLost', {
  desc = 'User: Auto-cleanup. Once a week, on first `FocusLost`, delete older files.',
  once = true,
  callback = function()
    if os.date '%a' ~= 'Mon' or jit.os == 'windows' then
      return
    end
    vim.system { 'find', vim.o.viewdir, '-mtime', '+30d', '-delete' }
    vim.system { 'find', vim.o.undodir, '-mtime', '+15d', '-delete' }
    vim.system { 'find', vim.lsp.log.get_filename(), '-size', '+50M', '-delete' }
  end,
})
