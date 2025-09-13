return {
  require 'astor.plugins.fuzzy-finder.snacks-picker',
  {
    'dmtrKovalenko/fff.nvim',
    build = 'cargo build --release',
    event = 'VeryLazy',
    opts = {
      prompt = '',
      layout = {
        prompt_position = 'top',
      },
    },
  },
}
