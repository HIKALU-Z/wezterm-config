local wezterm = require("wezterm")
local colors = require("colors.custom")
-- local fonts = require('config.fonts')

local border_color = "#000"
return {
    term = "xterm-256color",
    animation_fps = 60,
    max_fps = 60,
    front_end = "WebGpu",
    webgpu_power_preference = "HighPerformance",

    -- color scheme
    -- colors = colors,
    -- color_scheme = "Gruvbox dark, medium (base16)",

    -- background
    -- window_background_opacity = 1.00,
    window_background_opacity = 0.85,
    win32_system_backdrop = "Acrylic",
    -- window_background_gradient = {
    --     colors = {"#85ab7d", "#77116f"},
    --     -- Specifices a Linear gradient starting in the top left corner.
    --     orientation = {
    --         Linear = {
    --             angle = -45.0
    --         }
    --     }
    -- },
    background = {{
        source = {
            File = wezterm.config_dir .. "/backdrops/space.jpeg"
        }
    }, {
        source = {
            Color = "#222436"
        },
        height = "100%",
        width = "100%",
        -- opacity = 0.95
        opacity = 0.97
    }},

    -- scrollbar
    enable_scroll_bar = false,
    min_scroll_bar_height = "1cell",
    colors = {
        -- scrollbar_thumb = "#34354D"
        scrollbar_thumb = "#767678"
    },

    -- tab bar
    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = false,
    use_fancy_tab_bar = true,
    tab_max_width = 25,
    show_tab_index_in_tab_bar = true,
    switch_to_last_active_tab_when_closing_tab = true,

    -- cursor
    default_cursor_style = "BlinkingBlock",
    cursor_blink_ease_in = "Constant",
    cursor_blink_ease_out = "Constant",
    cursor_blink_rate = 700,

    -- window
    adjust_window_size_when_changing_font_size = false,
    window_decorations = "INTEGRATED_BUTTONS|RESIZE",
    -- window_decorations = "RESIZE",
    integrated_title_button_style = "Windows",
    integrated_title_button_color = "auto",
    integrated_title_button_alignment = "Right",
    initial_cols = 120,
    initial_rows = 30,
    window_padding = {
        left = 5,
        right = 5,
        top = 10,
        bottom = 10
    },
    window_close_confirmation = "AlwaysPrompt",
    window_frame = {
        active_titlebar_bg = "#0F2536",
        inactive_titlebar_bg = "#0F2536",
        -- active_titlebar_fg = "#000",
        -- inactive_titlebar_fg = "#000",
        -- Hikalu 自添加
        border_left_width = "0.25cell",
        border_right_width = "0.25cell",
        border_bottom_height = "0.125cell",
        border_top_height = "0.125cell",
        border_left_color = border_color,
        border_right_color = border_color,
        border_bottom_color = border_color,
        border_top_color = border_color
    },
    inactive_pane_hsb = {
        saturation = 1.0,
        brightness = 1.0
    }
}
