-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.font_size = 30

config.enable_tab_bar = true
config.window_decorations = "RESIZE"
config.window_background_opacity = 1.0
config.macos_window_background_blur = 10

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- my coolnight colorscheme:
-- config.colors = {
-- 	foreground = "#CBE0F0",
-- 	background = "#011423",
-- 	cursor_bg = "#47FF9C",
-- 	cursor_border = "#47FF9C",
-- 	cursor_fg = "#011423",
-- 	selection_bg = "#033259",
-- 	selection_fg = "#CBE0F0",
-- 	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
-- 	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
-- }

config.keys = {
  -- This will create a new split and run the `top` program inside it
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitPane {
      direction = 'Right',
      size = { Percent = 50 },
    },
  },
  {
    key = 'd',
    mods = 'SHIFT|CMD',
    action = wezterm.action.SplitPane {
      direction = 'Down',
      size = { Percent = 50 },
    },
  },
    -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
    {key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb"}},
    -- Make Option-Right equivalent to Alt-f; forward-word
    {key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"}},
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
-- Cycle to the next pane
    {key="[", mods="CMD", action=wezterm.action{ActivatePaneDirection="Next"}},
-- Cycle to the previous pane
    {key="]", mods="CMD", action=wezterm.action{ActivatePaneDirection="Prev"}},
-- Fullscreen pane in tab
    {key='z', mods='CMD', action = wezterm.action.TogglePaneZoomState},
    -- {key='PageDown', mods='NONE', action = action=wezterm.action.ScrollByPage(1)},
}


config.color_scheme = 'Abernathy'
-- config.color_scheme = 'Andromeda'
-- config.color_scheme = 'Apple Classic'
-- config.color_scheme = 'arcoiris'
-- config.color_scheme = 'Argonaut'
-- config.color_scheme = 'Atelier Lakeside (base16)'
-- config.color_scheme = 'Atelier Plateau Light (base16)'
-- config.color_scheme = 'Bamboo Multiplex'
-- config.color_scheme = 'Belge (terminal.sexy)'

-- and finally, return the configuration to wezterm
-- local act = wezterm.action
-- config.keys = {
--    { key = 'PageUp', mods = 'SHIFT', action = act.DisableDefaultAssignment },
--    { key = 'PageDown', mods = 'SHIFT', action = act.DisableDefaultAssignment },
-- }
--
return config
