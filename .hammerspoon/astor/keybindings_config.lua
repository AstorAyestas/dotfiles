local module = {}

module.name = 'keybindings_config'
module.description = 'module that contains all the keybindings'

module.apps = {
  { key = 'b', prefix = { 'Option' }, bundleId = 'com.brave.Browser' },
  { key = 'c', prefix = { 'Option' }, bundleId = 'com.tinyspeck.slackmacgap' },
  { key = 'd', prefix = { 'Option' }, bundleId = 'org.jkiss.dbeaver.core.product' },
  { key = 'e', prefix = { 'Option' }, bundleId = 'com.docker.docker' },
  { key = 'g', prefix = { 'Option' }, bundleId = 'com.google.Chrome' },
  { key = 'i', prefix = { 'Option' }, bundleId = 'com.github.wez.wezterm' },
  { key = 'o', prefix = { 'Option' }, bundleId = 'md.obsidian' },
  { key = 'p', prefix = { 'Option' }, bundleId = 'com.postmanlabs.mac' },
  { key = 's', prefix = { 'Option' }, bundleId = 'com.apple.Safari' },
  { key = 'v', prefix = { 'Option' }, bundleId = 'com.microsoft.VSCode' },
}

module.window_resize = {
  half_left = { key = 'left', prefix = { 'Command', 'Option', 'Ctrl' } },
  half_right = { key = 'right', prefix = { 'Command', 'Option', 'Ctrl' } },
  maximize = { key = 'm', prefix = { 'Command', 'Option', 'Ctrl' } },
}

module.window_position = {
  center = { key = 'c', prefix = { 'Command', 'Option', 'Ctrl' } },
}

return module
