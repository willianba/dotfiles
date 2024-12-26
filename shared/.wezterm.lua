local wezterm = require("wezterm")

local padding = 8
local windows_font_size = 14
local mac_font_size = 15

local wsl_default_domain = "WSL:Debian"
local is_windows = wezterm.target_triple == "x86_64-pc-windows-msvc"
local is_mac = wezterm.target_triple == "aarch64-apple-darwin"

local wsl_domains = wezterm.default_wsl_domains()
for _, dom in ipairs(wsl_domains) do
	dom.default_cwd = "~"
end

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return is_windows and "Catppuccin Mocha" or "Catppuccin Macchiato"
	else
		return "Catppuccin Latte"
	end
end

local keys = {
	{ key = "a", mods = "LEADER|CTRL", action = wezterm.action({ SendString = "\x01" }) },
	{ key = "v", mods = "LEADER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	{ key = "s", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "o", mods = "LEADER", action = "TogglePaneZoomState" },

	{ key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	{ key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	{ key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
	{ key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },

	{ key = "H", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
	{ key = "J", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
	{ key = "K", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
	{ key = "L", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },

	{ key = "t", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
	{ key = "w", mods = "LEADER", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
	{ key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },

	{ key = "t", mods = "ALT|SHIFT", action = wezterm.action.ShowLauncher },

	{
		key = "R",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PromptInputLine({
			description = "=== Rename current tab ===",
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be nil if the user cancelled the input
				-- and empty if they hit enter without typing anything
				-- otherwise it will contain the text they typed
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	{
		key = "w",
		mods = "ALT",
		action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
	},
}

for i = 1, 9 do
	table.insert(keys, {
		key = tostring(i),
		mods = "CTRL|ALT",
		action = wezterm.action.MoveTab(i - 1),
	})
end

return {
	-- general
	check_for_updates = true,
	native_macos_fullscreen_mode = is_mac and true or nil,
	default_domain = is_windows and wsl_default_domain or nil,
	default_prog = is_windows and { "wsl.exe" } or nil,
	launch_menu = is_windows and {
		{ label = "PowerShell Core", args = { "pwsh.exe" }, domain = { DomainName = "local" } },
	} or nil,
	wsl_domains = wsl_domains,

	-- appearance
	color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,
	window_padding = {
		left = padding,
		right = padding,
		top = padding,
		bottom = padding,
	},
	initial_rows = 40,
	initial_cols = 140,
	enable_scroll_bar = true,

	-- fonts
	font = wezterm.font("Hack Nerd Font"),
	font_size = is_windows and windows_font_size or mac_font_size,
	leader = { key = "a", mods = "CTRL" },
	keys = keys,
}
