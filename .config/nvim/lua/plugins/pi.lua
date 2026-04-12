vim.pack.add {
  { src = 'https://github.com/nvzone/volt', name = 'volt' },
  {
    -- src = '~/personal/example.nvim',
    src = '/Users/astorayestas/personal/pi.nvim',
    name = 'pi',
  },
}

vim.opt.rtp:prepend '/Users/astorayestas/personal/pi.nvim'

local pi = require 'pi'
pi.setup {
  -- debug = true, -- Enable debug logging to /tmp/pi-nvim.log
  -- auto_start = false,
}

-- Core operations
vim.keymap.set('v', '<leader>pe', pi.visual, { desc = 'Pi: Edit selection' })
vim.keymap.set('n', '<leader>pp', pi.open_prompt, { desc = 'Pi: Prompt' })
vim.keymap.set('n', '<leader>pa', pi.abort, { desc = 'Pi: Abort' })

-- Model control (matches pi: Ctrl+P cycles, Ctrl+L opens picker)
vim.keymap.set('n', '<leader>pl', pi.cycle_model, { desc = 'Pi: Cycle model' })
vim.keymap.set('n', '<leader>pL', pi.open_model_picker, { desc = 'Pi: Model picker' })

-- Thinking control (matches pi: Shift+Tab cycles thinking)
vim.keymap.set('n', '<leader>pt', pi.cycle_thinking_level, { desc = 'Pi: Cycle thinking' })
vim.keymap.set('n', '<leader>pT', pi.open_thinking_picker, { desc = 'Pi: Thinking picker' })
