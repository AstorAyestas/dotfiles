local module = {}

module.name = 'init'

-- Hammerspoon Preferences
hs.autoLaunch(true)
hs.automaticallyCheckForUpdates(true)
hs.dockIcon(false)
hs.menuIcon(false)
hs.consoleOnTop(false)
hs.uploadCrashData(false)

require 'astor/window_management'
require 'astor/app_launcher'

return module
