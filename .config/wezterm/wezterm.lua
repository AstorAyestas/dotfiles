local wezterm = require 'wezterm'

return {
  font = wezterm.font_with_fallback { 'Monaspace Argon', { family = 'Hack Nerd Font', scale = 0.75 } },
  font_size = 16,
  enable_tab_bar = false,
  color_scheme = 'Kanagawa (Gogh)',
  window_decorations = 'RESIZE',
  initial_rows = 43,
  initial_cols = 150,
  window_padding = {
    left = 8,
    right = 8,
    top = 8,
    bottom = 8,
  },
}
