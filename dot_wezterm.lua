-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font 'MonaspiceNe Nerd Font Mono'
config.font_size = 16

-- and finally, return the configuration to wezterm
return config
