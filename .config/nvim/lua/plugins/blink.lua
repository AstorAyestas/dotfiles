vim.pack.add {
  {
    src = 'https://github.com/saghen/blink.compat',
    name = 'blink.compat',
    version = vim.version.range '2.x',
  },
  {
    src = 'https://github.com/saghen/blink.cmp',
    name = 'blink.cmp',
    version = vim.version.range '*',
  },
}

require('blink-cmp').setup()

local blink = require 'blink.cmp'

---@module 'blink.cmp'
---@type blink.cmp.Config
blink.setup {
  keymap = { preset = 'default' },
  appearance = {
    nerd_font_variant = 'mono',
  },
  completion = {
    menu = {
      draw = {
        treesitter = { 'lsp' },
      },
    },
    documentation = { auto_show = false, auto_show_delay_ms = 500 },
  },
  sources = {
    default = { 'lsp', 'path', 'buffer', 'snippets', 'cmp' },
    per_filetype = {},
    providers = {
      snippets = {
        min_keyword_length = 1,
        score_offset = 1,
        opts = {
          search_paths = { '~/dotfiles/.config/nvim/snippets' },
        },
      },
    },
  },
  fuzzy = { implementation = 'prefer_rust_with_warning' },
  signature = { enabled = true },
  auto_brackets = { enabled = false },
}
