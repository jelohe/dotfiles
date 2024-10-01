local wezterm = require 'wezterm'
local act = wezterm.action

local config = wezterm.config_builder()

-- Tab bar
config.font_size = 12
config.use_fancy_tab_bar = true
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}
config.enable_scroll_bar = false
config.window_decorations = 'RESIZE'

-- Pretty colors
config.color_scheme = 'Wryan'
config.font = wezterm.font 'JetBrains Mono'

-- Leader key
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

-- Action wrappers
NewTab = act.SpawnTab 'CurrentPaneDomain'
HSplit = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
VSplit = act.SplitVertical { domain = 'CurrentPaneDomain' }
ClosePane = act.CloseCurrentPane { confirm = true }
ZoomPane = act.TogglePaneZoomState
Left = act.ActivatePaneDirection('Left')
Right = act.ActivatePaneDirection('Right')
Up = act.ActivatePaneDirection('Up')
Down = act.ActivatePaneDirection('Down')

config.keys = {
  -- Pane/window management
  { mods = 'LEADER', key = 'c', action = NewTab },
  { mods = 'LEADER', key = '/', action = HSplit },
  { mods = 'LEADER', key = '-', action = VSplit },
  { mods = 'LEADER', key = 'x', action = ClosePane },
  { mods = 'LEADER', key = 'z', action = ZoomPane },

  -- Pane navigation
  { mods = 'LEADER', key = 'h', action = Left },
  { mods = 'LEADER', key = 'l', action = Right },
  { mods = 'LEADER', key = 'k', action = Up },
  { mods = 'LEADER', key = 'j', action = Down },
}

return config
