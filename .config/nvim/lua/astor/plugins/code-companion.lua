return {
  'olimorris/codecompanion.nvim',
  cmd = { 'CodeCompanion', 'CodeCompanionChat', 'CodeCompanionActions' },
  dependencies = {
    'j-hui/fidget.nvim', -- Display status
  },
  opts = {
    extensions = {},
    adapters = {
      ollama = function()
        return require('codecompanion.adapters').extend('ollama', {
          schema = {
            model = {
              default = 'qwen2.5-coder:7b',
            },
            num_ctx = {
              default = 20000,
            },
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = 'ollama',
        roles = {
          user = 'astor',
        },
        keymaps = {
          send = {
            modes = { n = '<C-a>', i = '<C-a>' },
            opts = {},
          },
          close = {
            modes = { n = '<C-c>', i = '<C-c>' },
            opts = {},
          },
        },
        slash_commands = {
          ['file'] = {
            description = 'Select a file using snacks',
            opts = {
              provider = 'snacks',
              contains_code = true,
            },
          },
        },
      },
    },
    display = {
      action_palette = {
        provider = 'default',
      },
      chat = {
        -- show_references = true,
        -- show_header_separator = false,
        -- show_settings = false,
      },
      diff = {
        provider = 'mini_diff',
      },
    },
  },
  keys = {
    {
      '<leader>co',
      '<cmd>CodeCompanionActions<CR>',
      desc = 'Open the action palette',
      mode = { 'n', 'v' },
    },
    {
      '<leader>ct',
      '<cmd>CodeCompanionChat Toggle<CR>',
      desc = 'Toggle a chat buffer',
      mode = { 'n', 'v' },
    },
    {
      '<leader>ca',
      '<cmd>CodeCompanionChat Add<CR>',
      desc = 'Add code to a chat buffer',
      mode = { 'v' },
    },
  },
  init = function()
    vim.cmd [[cab cc CodeCompanion]]
    require('astor.plugins.custom.spinner'):init()
  end,
}
