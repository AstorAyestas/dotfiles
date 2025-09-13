local wezterm = require 'wezterm'
local mux = wezterm.mux
local config = wezterm.config_builder()
local smart_splits = wezterm.plugin.require 'https://github.com/mrjones2014/smart-splits.nvim'
local sessionizer = wezterm.plugin.require 'https://github.com/mikkasendke/sessionizer.wezterm'
local history = wezterm.plugin.require 'https://github.com/mikkasendke/sessionizer-history'

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

local schema = {
  sessionizer.FdSearch '~/work',
}

config.font = wezterm.font_with_fallback { 'Input', { family = 'Hack Nerd Font', scale = 0.75 } }
config.font = wezterm.font 'Input'
config.font_size = 18
config.enable_tab_bar = false
config.color_scheme = 'tokyonight_night'
config.native_macos_fullscreen_mode = true
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
config.disable_default_key_bindings = true

config.window_padding = {
  left = 8,
  right = 8,
  top = 64,
  bottom = 16,
}
config.leader = {
  key = 's',
  mods = 'CTRL',
  timeout_milliseconds = 2000,
}
config.keys = {
  {
    mods = 'LEADER',
    key = '-',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    mods = 'LEADER',
    key = '|',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    mods = 'LEADER',
    key = 'z',
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    mods = 'LEADER',
    key = 's',
    action = sessionizer.show(schema),
  },
  {
    mods = 'LEADER',
    key = 'm',
    action = history.switch_to_most_recent_workspace,
  },
}

smart_splits.apply_to_config(config)

return config
