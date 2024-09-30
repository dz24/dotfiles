-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.font_size = 25

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

config.keys = {
-- This will create a new split and run the `top` program inside it
    {key = 'd', mods = 'ALT', action = wezterm.action.SplitPane {
     direction = 'Right', size = { Percent = 50 }}},
    {key = 'd', mods = 'SHIFT|ALT', action = wezterm.action.SplitPane {
     direction = 'Down', size = { Percent = 50 }}},
  { key = 't',
    mods = 'ALT',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
    {key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb"}},
-- Make Option-Right equivalent to Alt-f; forward-word
    {key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"}},
-- Close pane
    {key = 'w', mods = 'ALT', action = wezterm.action.CloseCurrentPane { confirm = true }},
-- Cycle to the next pane
    {key="[", mods="ALT", action=wezterm.action{ActivatePaneDirection="Next"}},
-- Cycle to the previous pane
    {key="]", mods="ALT", action=wezterm.action{ActivatePaneDirection="Prev"}},
-- move pane
    {key="h", mods="ALT", action=wezterm.action{ActivatePaneDirection="Left"}},
    {key="l", mods="ALT", action=wezterm.action{ActivatePaneDirection="Right"}},
    {key="k", mods="ALT", action=wezterm.action{ActivatePaneDirection="Up"}},
    {key="j", mods="ALT", action=wezterm.action{ActivatePaneDirection="Down"}},
-- Fullscreen pane in tab
    {key='z', mods='ALT', action = wezterm.action.TogglePaneZoomState},
-- activate pane selection mode with numeric labels
    { key = '1', mods = 'ALT', action = wezterm.action.PaneSelect },
    { key = '2', mods = 'ALT', action = wezterm.action.PaneSelect {
      alphabet = '1234567890',
    }, },
  -- show the pane selection mode, but have it swap the active and selected panes
    { key = '3', mods = 'ALT', action = wezterm.action.PaneSelect {
      mode = 'SwapWithActive',
    },
  },
}


config.color_scheme = 'Abernathy'

-- and finally, return the configuration to wezterm
-- local act = wezterm.action
-- config.keys = {
--    { key = 'PageUp', mods = 'SHIFT', action = act.DisableDefaultAssignment },
--    { key = 'PageDown', mods = 'SHIFT', action = act.DisableDefaultAssignment },
--    {key='PageDown', mods='NONE', action = action=wezterm.action.ScrollByPage(1)},
-- }
--
return config
