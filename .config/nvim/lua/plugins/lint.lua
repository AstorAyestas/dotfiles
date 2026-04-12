vim.pack.add {
  {
    src = 'https://github.com/mfussenegger/nvim-lint',
    name = 'nvim-lint',
  },
}

local lint = require 'lint'

lint.linters_by_ft = {
  javascript = { 'eslint_d', 'oxlint' },
  typescript = { 'eslint_d', 'oxlint' },
  javascriptreact = { 'eslint_d', 'oxlint' },
  typescriptreact = { 'eslint_d', 'oxlint' },
  python = { 'ruff' },
}

local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
  group = lint_augroup,
  callback = function()
    if vim.bo.modifiable then lint.try_lint() end
  end,
})
