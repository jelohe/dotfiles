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

function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

-- Go have fun!
local config = wezterm.config_builder()

-- Startup as Ubuntu on WSL
config.default_domain = 'WSL:UbuntuD' -- $ wsl -l -v

-- Disable annoying bell
config.audible_bell = "Disabled"

-- Tab bar
config.font_size = 12
config.use_fancy_tab_bar = true
config.window_padding = {
    left   = 18,
    right  = 18,
    top    = 18,
    bottom = 18,
}
config.enable_scroll_bar = false
config.window_decorations = 'RESIZE'

-- Pretty colors
function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    -- return 'Grayscale Dark (base16)'
    return 'Neobones'
  else
    -- return 'Grayscale Light (base16)'
    return 'Neobones_light'
  end
end

config.color_scheme = scheme_for_appearance(get_appearance())
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
  { mods = 'ALT', key = 'h', action = Left },
  { mods = 'ALT', key = 'l', action = Right },
  { mods = 'ALT', key = 'k', action = Up },
  { mods = 'ALT', key = 'j', action = Down },
  -- Split resize
  { mods = 'ALT', key = 'H', action = PaneLeft },
  { mods = 'ALT', key = 'L', action = PaneRight },
  { mods = 'ALT', key = 'K', action = PaneUp },
  { mods = 'ALT', key = 'J', action = PaneDown },

  -- Tabs
  { mods = 'LEADER', key = 'c', action = NewTab },
  -- Tab nav
  umap(range(1, 8), function(n) return
      { mods = 'ALT', key = tostring(n), action = OpenTab(n) }
  end),
}

return config
