vim.pack.add {
  {
    src = 'https://github.com/stevearc/conform.nvim',
    name = 'conform',
  },
}
---@module 'conform'
---@type conform.setupOpts
require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescriptreact = { 'prettier' },
    css = { 'prettier' },
    html = { 'prettier' },
    json = { 'prettier' },
    python = {
      -- To fix auto-fixable lint errors.
      'ruff_fix',
      -- To run the Ruff formatter.
      'ruff_format',
      -- To organize the imports.
      'ruff_organize_imports',
    },
  },
  format_on_save = {
    lsp_format = 'fallback',
    timeout_ms = 500,
  },
}
