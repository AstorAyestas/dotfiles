vim.pack.add {
  {
    src = '/Users/astorayestas/personal/99',
    name = '99',
  },
}

vim.opt.rtp:prepend '/Users/astorayestas/personal/99'

local plugin = require '99'
local fzf = require '99.extensions.fzf_lua'
plugin.setup { provider = plugin.Providers.PiCodingAgent, completion = {
  custom_rules = {
    '~/.pi/agent/skills',
  },
  source = 'blink',
} }

vim.keymap.set('v', '<leader>9v', function() plugin.visual() end, { desc = '99: Edit selection' })

vim.keymap.set('n', '<leader>9x', function() plugin.stop_all_requests() end, { desc = '99: Abort' })

vim.keymap.set('n', '<leader>9s', function() plugin.search() end, { desc = '99: Search' })

vim.keymap.set('n', '<leader>9m', function() fzf.select_model() end, { desc = '99: Select model' })

vim.keymap.set('n', '<leader>9p', function() fzf.select_provider() end, { desc = '99: Select provider' })
