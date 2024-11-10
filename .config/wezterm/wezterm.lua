local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return {
  font = wezterm.font_with_fallback { 'Monaspace Argon', { family = 'Hack Nerd Font', scale = 0.75 } },
  font_size = 16,
  enable_tab_bar = false,
  color_scheme = 'Kanagawa (Gogh)',
  native_macos_fullscreen_mode = false,
  window_decorations = 'RESIZE',
  window_padding = {
    left = 8,
    right = 8,
    top = 8,
    bottom = 8,
  },
}
