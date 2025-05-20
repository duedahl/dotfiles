local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Functionality Changes
config.enable_tab_bar = false

-- General appearance
config.color_scheme = 'Catpuccin Mocha'
config.font = wezterm.font('JetBrains Mono')
config.font_size = 10.0
config.window_background_opacity = 0.8

-- GNOME/X11 specific configurations
config.enable_wayland = false

return config
