vim.pack.add { 'https://github.com/dmtrKovalenko/fff.nvim' }

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'fff.nvim' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then vim.cmd.packadd 'fff.nvim' end
      require('fff.download').download_or_build_binary()
    end
  end,
})

local fff = require 'fff'

vim.g.fff = {
  lazy_sync = true,
  prompt = '>',
  layout = {
    height = 0.75,
    width = 0.80,
    prompt_position = 'top',
    preview_position = 'right',
    preview_size = 0.50,
    show_scrollbar = true,
  },
  preview = {
    enabled = true,
    line_numbers = false,
  },
  hl = {
    border = 'FloatBorder',
  },
  debug = {
    enabled = true,
    show_scores = false,
  },
}

vim.keymap.set('n', '<leader>sf', function() fff.find_files() end, { desc = '[S]earch [F]iles' })

vim.keymap.set(
  'n',
  '<leader>sg',
  function()
    fff.live_grep {
      grep = {
        modes = { 'plain', 'regex', 'fuzzy' },
      },
    }
  end,
  { desc = '[S]earch by [G]rep' }
)

vim.keymap.set(
  { 'n', 'x' },
  '<leader>sw',
  function()
    fff.live_grep {
      query = vim.fn.expand '<cword>',
      grep = {
        modes = { 'plain', 'regex', 'fuzzy' },
      },
    }
  end,
  { desc = '[s]earch current [w]ord' }
)
