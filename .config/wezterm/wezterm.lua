-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 150
config.initial_rows = 200

-- or, changing the font size and color scheme.
config.font = wezterm.font('JetBrainsMono Nerd Font', {})
config.harfbuzz_features = { 'calt=0' }
config.font_size = 18
config.color_scheme = 'OneHalfDark'

config.enable_tab_bar = false

config.window_decorations = 'RESIZE'

-- config.disable_default_key_bindings = true

config.keys = {
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = wezterm.action { SendString = '\x1bb' },
  },
  -- Make Option-Right equivalent to Alt-f; forward-word
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = wezterm.action { SendString = '\x1bf' },
  },
  {
    key = 'LeftArrow',
    mods = 'CMD',
    action = wezterm.action { SendString = '\x1bOH' },
  },
  {
    key = 'RightArrow',
    mods = 'CMD',
    action = wezterm.action { SendString = '\x1bOF' },
  },
}

-- config.force_reverse_video_cursor = true

config.colors = {
  foreground = '#c5c9c5',
  background = '#181616',
  --
  cursor_bg = '#C8C093',
  cursor_border = '#C8C093',
  cursor_fg = 'black',

  selection_fg = '#C8C093',
  selection_bg = '#2D4F67',

  scrollbar_thumb = '#16161D',
  split = '#16161D',

  ansi = {
    '#0D0C0C',
    '#C4746E',
    '#8A9A7B',
    '#C4B28A',
    '#8BA4B0',
    '#A292A3',
    '#8EA4A2',
    '#C8C093',
  },
  brights = {
    '#A6A69C',
    '#E46876',
    '#87A987',
    '#E6C384',
    '#7FB4CA',
    '#938AA9',
    '#7AA89F',
    '#C5C9C5',
  },
}
-- this would make the terminal transparent, I don't know if I like it
config.window_background_opacity = 0.95
config.macos_window_background_blur = 10
return config
