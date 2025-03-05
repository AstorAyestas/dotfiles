return {
  'chrisgrieser/nvim-chainsaw',
  event = 'VeryLazy',
  opts = {},
  keys = {
    {
      '<leader>pc',
      function()
        require('chainsaw').removeLogs()
      end,
      mode = { 'n', 'x' },
      desc = '󰅗 [P]rint [C]leanup',
    },
    {
      '<leader>po',
      function()
        require('chainsaw').objectLog()
      end,
      mode = { 'n', 'x' },
      desc = '⬟ [P]rint [O]bject',
    },
    {
      '<leader>pv',
      function()
        require('chainsaw').variableLog()
      end,
      mode = { 'n', 'x' },
      desc = '󰀫 [P]rint [V]ariable',
    },
    {
      '<leader>pt',
      function()
        require('chainsaw').typeLog()
      end,
      mode = { 'n', 'x' },
      desc = '󰜀 [P]rint [T]ype',
    },
    {
      '<leader>pm',
      function()
        require('chainsaw').messageLog()
      end,
      desc = '󰍩 [P]rint [M]essage',
    },
  },
}
