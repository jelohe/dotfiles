local wezterm = require 'wezterm'
local act = wezterm.action

-- Go have fun!
local config = wezterm.config_builder()

-- Startup as Ubuntu on WSL
-- config.default_domain = 'WSL:UbuntuD' -- $ wsl -l -v

-- Disable annoying bell
config.audible_bell = "Disabled"

-- Tab bar
config.font_size = 14
config.enable_tab_bar = false
config.window_padding = {
    left   = 18,
    right  = 18,
    top    = 18,
    bottom = 18,
}
config.enable_scroll_bar = false
config.window_decorations = 'NONE'
config.window_background_opacity = 0.85

config.color_scheme = 'Catppuccin Macchiato'
config.font = wezterm.font 'Consolas'

return config
