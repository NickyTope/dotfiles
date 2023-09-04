-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "nightfox"

config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}

config.keys = {
	{
		key = "u",
		mods = "ALT",
		action = wezterm.action.PaneSelect,
	},
	{
		key = "t",
		mods = "ALT",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "v",
		mods = "ALT",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	{
		key = "v",
		mods = "CTRL|ALT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
}

config.colors = {
	tab_bar = {
		-- The color of the inactive tab bar edge/divider
		inactive_tab_edge = "#dddddd",
	},
}

config.font = wezterm.font({
	family = "JetBrainsMono Nerd Font",
	italic = false,
})
config.font_rules = {
	{
		italic = true,
		font = wezterm.font({
			family = "Fisa Code",
			style = "Italic",
		}),
	},
	{
		intensity = "Bold",
		font = wezterm.font({
			family = "Free Mono",
			weight = "ExtraBold",
		}),
	},
}
config.font_size = 10

-- and finally, return the configuration to wezterm
return config
