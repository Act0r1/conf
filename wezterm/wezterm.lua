local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
    automatically_reload_config = true,
    enable_tab_bar = false,
    window_close_confirmation = "NeverPrompt",
    window_decorations = "RESIZE",
    font = wezterm.font("Comic Mono"),
    font_size = 14.5,
    background = {
        {
            source = {
                File = "/Users/yea8er/Pictures/alone.png",
            },
            hsb = {
                hue = 1.0,
                saturation = 1.0,
                brightness = 0.1,
            },
            width = "100%",
            height = "100%",
        },
        -- {
        --     source = {
        --         Color = "#282c35",
        --     },
        --     width = "100%",
        --     height = "100%",
        --     opacity = 0.5,
        -- },
    },
}
config.color_scheme = "Tokyo Night"
config.native_macos_fullscreen_mode = true
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}
return config
