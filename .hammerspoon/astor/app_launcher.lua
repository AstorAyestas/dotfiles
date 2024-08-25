local module = {}
module.name = 'app_launcher'
module.description = 'module to handle the app launch functionalities'

local apps = require('astor/keybindings_config').apps

-- function toggleAppByBundleId(bundleID) to launch, focus or hide an application
local function toggleAppByBundleId(bundleID)
  local frontApp = hs.application.frontmostApplication()
  if frontApp:bundleID() == bundleID and frontApp:focusedWindow() then
    frontApp:hide()
  else
    hs.application.launchOrFocusByBundleID(bundleID)
  end
end

-- loop to the specified key combinations
hs.fnutils.each(apps, function(item)
  hs.hotkey.bind(item.prefix, item.key, function()
    toggleAppByBundleId(item.bundleId)
  end)
end)

return module
