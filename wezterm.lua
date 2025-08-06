-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.color_scheme = 'Tokyo Night'

config.font = wezterm.font("MesloLGS Nerd Font Mono")

config.enable_tab_bar = false
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 2,
}

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.70
config.macos_window_background_blur = 20

-- Faz o Option funcionar como Alt
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = false

config.use_dead_keys = false
config.default_cursor_style = "SteadyBlock"

-- Mapeia Option + setas e Option + Delete
config.keys = {
  {
    key = 'LeftArrow',
    mods = 'ALT',
    action = wezterm.action.SendString('\x1bb'), -- ESC + b
  },
  {
    key = 'RightArrow',
    mods = 'ALT',
    action = wezterm.action.SendString('\x1bf'), -- ESC + f
  },
  {
    key = 'Backspace',
    mods = 'ALT',
    action = wezterm.action.SendString('\x1b\x7f'), -- ESC + DEL
  },
}

-- and finally, return the configuration to wezterm
return config
