local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- General appearance
config.color_scheme = 'Catppuccin Mocha'  -- A popular dark theme
config.font = wezterm.font('JetBrains Mono')
config.font_size = 10.0
config.window_background_opacity = 0.8

-- GNOME/X11 specific configurations
config.enable_wayland = false
config.enable_tab_bar = true
config.use_fancy_tab_bar = true

return config
