-- function to center the current application window

local module = {}

module.name = 'window_management'
module.description = 'module to handle the window management functionalities'

local resize = require('astor/keybindings_config').window_resize
local position = require('astor/keybindings_config').window_position

-- function to center the windonw in the screen frame
local function centerWindow()
  local win = hs.window.frontmostWindow()
  if win then
    local screen = win:screen()
    local frame = screen:frame()
    local winFrame = win:frame()

    -- Center the window in the screen frame
    winFrame.x = frame.x + (frame.w - winFrame.w) / 2
    winFrame.y = frame.y + (frame.h - winFrame.h) / 2

    win:setFrame(winFrame)
  else
    return
  end
end

-- function to maximize the current application window
local function maximizeWindow()
  local win = hs.window.frontmostWindow()
  if win then
    win:maximize()
  end
end

-- function to re size cycling to the left from 1/2 -> 3/3 -> 1/3
local function resizeLeftCycle()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end

  local screen = win:screen()
  local max = screen:frame()
  local frame = win:frame()

  if math.abs(frame.w - max.w / 2) < 10 and frame.x == max.x then
    win:setFrame(hs.geometry.rect(max.x, max.y, max.w * 2 / 3, max.h))
  elseif math.abs(frame.w - max.w * 2 / 3) < 10 and frame.x == max.x then
    win:setFrame(hs.geometry.rect(max.x, max.y, max.w / 3, max.h))
  else
    win:setFrame(hs.geometry.rect(max.x, max.y, max.w / 2, max.h))
  end
end

-- function to re size cycling to the right from 1/2 -> 3/3 -> 1/3
local function resizeRightCycle()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end

  local screen = win:screen()
  local max = screen:frame()
  local frame = win:frame()

  if math.abs(frame.w - max.w / 2) < 10 and math.abs(frame.x - (max.x + max.w / 2)) < 10 then
    win:setFrame(hs.geometry.rect(max.x + max.w / 3, max.y, max.w * 2 / 3, max.h))
  elseif math.abs(frame.w - max.w * 2 / 3) < 10 and math.abs(frame.x - (max.x + max.w / 3)) < 10 then
    win:setFrame(hs.geometry.rect(max.x + max.w * 2 / 3, max.y, max.w / 3, max.h))
  else
    win:setFrame(hs.geometry.rect(max.x + max.w / 2, max.y, max.w / 2, max.h))
  end
end

-- left half the window with the key binding command+alt + left-arrow
hs.hotkey.bind(resize.half_left.prefix, resize.half_left.key, resizeLeftCycle)

-- right half the window with the key binding command+alt + right-arrow
hs.hotkey.bind(resize.half_right.prefix, resize.half_right.key, resizeRightCycle)

-- maximize the window with the key binding command+alt+control + f
hs.hotkey.bind(resize.maximize.prefix, resize.maximize.key, maximizeWindow)

-- center the window with the key binding command+alt+control + c
hs.hotkey.bind(position.center.prefix, position.center.key, centerWindow)

return module
