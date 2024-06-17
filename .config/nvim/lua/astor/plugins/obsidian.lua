return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  -- ft = 'markdown',
  event = {
    'BufReadPre ' .. vim.fn.expand '~' .. '/vaults/personal/**.md',
    'BufNewFile ' .. vim.fn.expand '~' .. '/vaults/personal/**.md',
    'BufReadPre ' .. vim.fn.expand '~' .. '/vaults/work/**.md',
    'BufNewFile ' .. vim.fn.expand '~' .. '/vaults/work/**.md',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('obsidian').setup {
      workspaces = {
        {
          name = 'personal',
          path = '~/vaults/personal',
        },
        {
          name = 'work',
          path = '~/vaults/work',
        },
      },
    }
    local keymap = vim.keymap
    keymap.set('n', '<leader>oc', "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>", { desc = '[O]bsidian [C]heck' })
    keymap.set('n', '<leader>oo', '<cmd>ObsidianOpen<CR>', { desc = '[O]bsidian [O]pen' })
    keymap.set('n', '<leader>ob', '<cmd>ObsidianBacklinks<CR>', { desc = '[O]bsidian show [B]acklinks' })
    keymap.set('n', '<leader>ol', '<cmd>ObsidianLinks<CR>', { desc = '[O]bsidian show [L]inks' })
    keymap.set('n', '<leader>on', '<cmd>ObsidianNew<CR>', { desc = '[O]bsidian [N]ew note' })
    keymap.set('n', '<leader>os', '<cmd>ObsidianSearch<CR>', { desc = '[O]bsidian [S]earch note' })
    keymap.set('n', '<leader>oq', '<cmd>ObsidianQuickSwitch<CR>', { desc = '[O]bsidian [Q]uick switch' })
  end,
}
