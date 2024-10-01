local wezterm = require 'wezterm'
local act = wezterm.action

local config = wezterm.config_builder()

config.color_scheme = 'Wryan'
config.font = wezterm.font 'JetBrains Mono'

config.keys = {
  {
      mods = 'CTRL', key = 't', -- New tab
      action = act.SpawnTab 'CurrentPaneDomain'
  },
  {
      mods = 'CTRL', key = '/', -- H split
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
      mods = 'CTRL', key = '-', -- V split
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    mods = 'CTRL', key = 'x', -- Close pane
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
      key = 'h',
      mods = 'ALT',
      action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
      key = 'j',
      mods = 'ALT',
      action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
      key = 'k',
      mods = 'ALT',
      action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
      key = 'l',
      mods = 'ALT',
      action = wezterm.action.ActivatePaneDirection 'Right',
  },
}

return config
