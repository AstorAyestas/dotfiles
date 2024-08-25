return {
  'rebelot/kanagawa.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    require('kanagawa').setup {
      theme = 'wave',
      overrides = function(colors)
        local theme = colors.theme
        return {
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
          PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
        }
      end,
    }
    vim.cmd [[colorscheme kanagawa-wave]]
  end,
}
