return {
  'chrisgrieser/nvim-scissors',
  opts = {
    snippetDir = '~/dotfiles/.config/nvim/snippets',
  },
  keys = {
    {
      '<leader>nn',
      function()
        require('scissors').editSnippet()
      end,
      desc = '󰩫 Edit snippets',
    },
    {
      '<leader>na',
      function()
        require('scissors').addNewSnippet()
      end,
      mode = { 'n', 'x' },
      desc = '󰩫 Add snippets',
    },
  },
}
