-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 150
config.initial_rows = 42

-- or, changing the font size and color scheme.
config.font_size = 16

-- config.color_scheme = "Default (dark) (terminal.sexy)"

-- config.color_scheme = "Material (terminal.sexy)"

-- config.color_scheme = "Tokyo Night (Gogh)"

-- config.color_scheme = "One Dark (Gogh)"

config.color_scheme = "OneDark (base16)"

-- config.background = {
-- 	{
-- 		source = {
-- 			File = "/home/zzf/wallpapers/ray-arknights-bt.jpg", -- 指定图片文件路径
-- 		},
-- 		-- 图片重复设置：设置 X 轴重复方式
-- 		repeat_x = "Repeat", -- 其他选项：'Mirror', 'NoRepeat'
-- 		repeat_y = "Repeat", -- 同理，Y 轴重复方式
-- 		opacity = 1, -- 设置透明度，范围 0 - 1
-- 		attachment = "Fixed", -- 设置视差效果，随着滚动产生背景层的深度效果
-- 		vertical_align = "Top", -- 图片垂直对齐方式：'Top', 'Middle', 'Bottom'
-- 		horizontal_align = "Right", -- 图片水平对齐方式：'Left', 'Center', 'Right'
-- 		hsb = { brightness = 0.02 },
-- 	},
-- }

config.inactive_pane_hsb = {
    saturation = 1,
    brightness = 0.6
}

-- config.window_background_opacity = 1 -- 0.85 is ok for trans
-- config.kde_window_background_blur = true

config.use_fancy_tab_bar = false -- 我们要自己画
config.window_close_confirmation = "NeverPrompt"
-- config.hide_tab_bar_if_only_one_tab = true
config.enable_tab_bar = false

-- Powerline Icons

config.tab_max_width = 60 -- 或者 60、80 随你

local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

-- Catppuccin Macchiato Palette
local C = {
    surface0 = "#363a4f",
    surface1 = "#494d64",
    surface2 = "#5b6078",
    overlay0 = "#6e738d",
    overlay1 = "#8087a2",
    overlay2 = "#939ab7",
    lavender = "#b7bdf8",
    blue = "#8aadf4",
    sapphire = "#7dc4e4",
    sky = "#91d7e3",
    teal = "#8bd5ca",
    green = "#a6da95",
    yellow = "#eed49f",
    peach = "#f5a97f",
    maroon = "#ee99a0",
    red = "#ed8796",
    pink = "#f5bde6",
    flamingo = "#f0c6c6",
    rosewater = "#f4dbd6",
    white = "#FFFFFF",
    ice_white = "#F0F8FF",
    mint_cream = "#F5FFFA"
}
--
-- -- 全图标表（支持别名与模糊匹配）
-- local process_icons = {
-- 	-- Shell
-- 	["bash"] = "",
-- 	["zsh"] = "󰰶",
-- 	["fish"] = "",
-- 	["sh"] = "",
--
-- 	-- Editors
-- 	["nvim"] = "",
-- 	["vim"] = "",
--
-- 	-- Languages / runtimes
-- 	["python"] = "",
-- 	["python3"] = "",
-- 	["python2"] = "",
-- 	["node"] = "",
-- 	["npm"] = "",
-- 	["deno"] = "",
-- 	["bun"] = "",
--
-- 	["lua"] = "",
-- 	["ruby"] = "",
-- 	["php"] = "",
-- 	["perl"] = "",
--
-- 	-- System tools
-- 	["ssh"] = "󰣀",
-- 	["htop"] = "󰾆",
-- 	["btop"] = "",
-- 	["top"] = "",
--
-- 	-- Build tools
-- 	["make"] = "",
-- 	["cmake"] = "",
-- 	["cargo"] = "",
-- 	["gcc"] = "",
-- 	["g++"] = "",
-- 	["clang"] = "",
-- 	["clang++"] = "",
--
-- 	-- Debugger
-- 	["gdb"] = "",
-- 	["lldb"] = "",
--
-- 	-- Version control
-- 	["git"] = "",
--
-- 	-- Default terminal
-- 	["default"] = "",
-- }
--
-- -- 智能识别函数：进程名 → 图标
-- local function get_process_icon(tab)
-- 	local full = tab.active_pane.foreground_process_name
-- 	if not full then
-- 		return process_icons["default"]
-- 	end
--
-- 	-- 提取纯命令名，例如 `/usr/bin/python3` → `python3`
-- 	local process = full:match("[^/]+$") or full
--
-- 	-- 直接命中
-- 	if process_icons[process] then
-- 		return process_icons[process]
-- 	end
--
-- 	-- 二级智能匹配（模糊匹配）
-- 	process = process:lower()
--
-- 	for key, icon in pairs(process_icons) do
-- 		if process:find(key) then
-- 			return icon
-- 		end
-- 	end
--
-- 	return process_icons["default"]
-- end
--
-- -- Fancy Tab Style
-- wezterm.on("format-tab-title", function(tab, tabs, panes, cfg, hover)
-- 	local bg = tab.is_active and C.green or C.surface1
-- 	local fg = tab.is_active and C.surface0 or C.overlay2
--
-- 	local process = tab.active_pane.foreground_process_name or ""
-- 	local icon = get_process_icon(tab)
--
-- 	-- Hover 时更亮
-- 	if hover then
-- 		bg = C.sky
-- 		fg = C.surface0
-- 	end
--
-- 	--         左边箭头    中间标题部分   右边箭头
-- 	return {
-- 		-- 左边箭头（外边背景）
-- 		{ Background = { Color = C.surface0 } },
-- 		{ Foreground = { Color = bg } },
-- 		{ Text = SOLID_LEFT_ARROW },
--
-- 		-- 中间 tab 内容区
-- 		{ Background = { Color = bg } },
-- 		{ Foreground = { Color = fg } },
-- 		{ Text = " " .. icon .. "  " .. tab.active_pane.title .. " " },
--
-- 		-- 右边箭头
-- 		{ Background = { Color = C.surface0 } },
-- 		{ Foreground = { Color = bg } },
-- 		{ Text = SOLID_RIGHT_ARROW },
-- 	}
-- end)

-- 明确指定字体 fallback 顺序，统一中文字体
config.font = wezterm.font_with_fallback({{
    family = "FiraCode Nerd Font" -- 主字体（英文、符号）
}, {
    family = "Noto Sans CJK SC" -- 统一使用「思源黑体 简体中文」显示中文
}})

local border_color = C.ice_white

config.colors = {
    split = border_color
}

config.window_frame = {
    border_left_width = "0.25cell",
    border_right_width = "0.25cell",
    border_bottom_height = "0.125cell",
    border_top_height = "0.125cell",
    border_left_color = border_color,
    border_right_color = border_color,
    border_bottom_color = border_color,
    border_top_color = border_color
}

config.adjust_window_size_when_changing_font_size = false

return config
