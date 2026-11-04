--## INPUT ################################################
-- See https://wiki.hypr.land/Configuring/Variables/#input
hl.config({
    input = {
        kb_layout = "it",

        follow_mouse = 1,
        numlock_by_default = true,

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.config({
    misc = {
        key_press_enables_dpms = true, -- key press will trigger wake
        mouse_move_enables_dpms = true, -- mouse move will trigger wake
    },
})

-- Scroll nicely in the terminal
hl.window_rule({ match = { class = "(Alacritty|kitty)" }, scroll_touchpad = 1.5 })
hl.window_rule({ match = { class = "com.mitchellh.ghostty" }, scroll_touchpad = 0.2 })
