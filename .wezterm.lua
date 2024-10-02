local wezterm = require 'wezterm'
local act = wezterm.action

-- Custom utilities
function range(start, finish)
  local t = {}
  for i = start, finish do
    t[#t + 1] = i
  end
  return t
end

function map(tbl, func)
  local new_tbl = {}
  for i, v in ipairs(tbl) do
    new_tbl[i] = func(v)
  end
  return new_tbl
end

function umap(tbl, func)
    return table.unpack(map(tbl, func))
end

-- Go have fun!
local config = wezterm.config_builder()

-- Startup as Ubuntu on WSL
config.default_domain = 'WSL:UbuntuD' -- $ wsl -l -v

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
-- Tabs
NewTab = act.SpawnTab 'CurrentPaneDomain'
OpenTab = function(n)
  return act.ActivateTab(n - 1)
end

-- Splits
CloseSplit = act.CloseCurrentPane { confirm = true }
ZoomSplit = act.TogglePaneZoomState

HSplit = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
VSplit = act.SplitVertical { domain = 'CurrentPaneDomain' }

PaneUp = act.AdjustPaneSize { 'Up', 8 }
PaneDown = act.AdjustPaneSize { 'Down', 8 }
PaneRight = act.AdjustPaneSize { 'Right', 8 }
PaneLeft = act.AdjustPaneSize { 'Left', 8 }

Left = act.ActivatePaneDirection('Left')
Right = act.ActivatePaneDirection('Right')
Up = act.ActivatePaneDirection('Up')
Down = act.ActivatePaneDirection('Down')

config.keys = {
  -- Splits
  { mods = 'LEADER', key = '/', action = HSplit },
  { mods = 'LEADER', key = '-', action = VSplit },
  { mods = 'LEADER', key = 'x', action = CloseSplit },
  { mods = 'LEADER', key = 'z', action = ZoomSplit },
  -- Split nav
  { mods = 'LEADER', key = 'h', action = Left },
  { mods = 'LEADER', key = 'l', action = Right },
  { mods = 'LEADER', key = 'k', action = Up },
  { mods = 'LEADER', key = 'j', action = Down },
  -- Split resize
  { mods = 'LEADER', key = 'H', action = PaneLeft },
  { mods = 'LEADER', key = 'L', action = PaneRight },
  { mods = 'LEADER', key = 'K', action = PaneUp },
  { mods = 'LEADER', key = 'J', action = PaneDown },

  -- Tabs
  { mods = 'LEADER', key = 'c', action = NewTab },
  -- Tab nav
  umap(range(1, 8), function(n) return
      { mods = 'LEADER', key = tostring(n), action = OpenTab(n) }
  end),
}

return config
