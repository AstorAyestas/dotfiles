return {
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',

  dependencies = {
    'folke/lazydev.nvim',
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'default' },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono',
    },

    completion = {
      menu = {
        draw = {
          treesitter = { 'lsp' },
        },
      },
      -- Optionally, set `auto_show = false` to show the documentation if
      -- you  press `<c-space>`.
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'buffer', 'lazydev' },
      per_filetype = {
        sql = { 'dadbod' },
      },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        dadbod = { name = 'Dadbod', module = 'vim_dadbod_completion.blink' },
      },
    },
    -- See :h blink-cmp-config-fuzzy for more information
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    -- Shows a signature help window while you type arguments for a function
    signature = { enabled = true },
  },
  opts_extend = { 'sources.default' },
}
