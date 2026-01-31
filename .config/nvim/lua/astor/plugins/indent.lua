return {
  --   'saghen/blink.indent',
  --   event = 'VeryLazy',
  --   --- @module 'blink.indent'
  --   --- @type blink.indent.Config
  --   config = function()
  --     vim.keymap.set('n', '<leader>ti', function()
  --       -- indent.enable(not indent.is_enabled())
  --       indent.enable(not indent.is_enabled { bufnr = 0 }, { bufnr = 0 })
  --     end, { desc = '[T]oggle [I]ndent' })
  --   end,
  --   opts = {
  --     scope = {
  --       highlights = { 'BlinkIndentScope' }, -- avoid multiple colors
  --     },
  --   },
}
