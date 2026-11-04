local settings = require("settings")

--## BINDINGS #############################################
-- See https://wiki.hypr.land/Configuring/Binds/


hl.config({ binds = {
    allow_workspace_cycles = true,
    movefocus_cycles_fullscreen = true,
} })

--## TILING #####################################

-- Close windows
hl.bind(settings.mod .. " + Q", hl.dsp.window.close(), { description = "Close window" })
hl.bind("CTRL + ALT + DELETE", hl.dsp.exec_cmd("" .. settings.config .. "/scripts/hypr-window-close-all"), { description = "Close all windows" })

-- Control tiling
hl.bind(settings.mod .. " + T", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle window floating" })
hl.bind(settings.mod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }), { description = "Full screen" })
hl.bind(settings.mod .. " + ALT + F", hl.dsp.window.fullscreen({ mode = "maximized" }), { description = "Full width" })
hl.bind(settings.mod .. " + period", hl.dsp.exec_cmd("" .. settings.config .. "/scripts/switch_layout.sh"), { description = "Switch layout" })

-- Focus
hl.bind(settings.mod .. " + LEFT", hl.dsp.focus({ direction = "left" }), { description = "Move window focus left" })
hl.bind(settings.mod .. " + RIGHT", hl.dsp.focus({ direction = "right" }), { description = "Move window focus right" })
hl.bind(settings.mod .. " + UP", hl.dsp.focus({ direction = "up" }), { description = "Move window focus up" })
hl.bind(settings.mod .. " + DOWN", hl.dsp.focus({ direction = "down" }), { description = "Move window focus down" })
hl.bind(settings.mod .. " + H", hl.dsp.focus({ direction = "left" }), { description = "Move window focus left" })
hl.bind(settings.mod .. " + L", hl.dsp.focus({ direction = "right" }), { description = "Move window focus right" })
hl.bind(settings.mod .. " + K", hl.dsp.focus({ direction = "up" }), { description = "Move window focus up" })
hl.bind(settings.mod .. " + J", hl.dsp.focus({ direction = "down" }), { description = "Move window focus down" })

-- Switch workspaces with $mod + [1-9; 0]
hl.bind(settings.mod .. " + code:10", hl.dsp.focus({ workspace = "1" }), { description = "Switch to workspace 1" })
hl.bind(settings.mod .. " + code:11", hl.dsp.focus({ workspace = "2" }), { description = "Switch to workspace 2" })
hl.bind(settings.mod .. " + code:12", hl.dsp.focus({ workspace = "3" }), { description = "Switch to workspace 3" })
hl.bind(settings.mod .. " + code:13", hl.dsp.focus({ workspace = "4" }), { description = "Switch to workspace 4" })
hl.bind(settings.mod .. " + code:14", hl.dsp.focus({ workspace = "5" }), { description = "Switch to workspace 5" })
hl.bind(settings.mod .. " + code:15", hl.dsp.focus({ workspace = "6" }), { description = "Switch to workspace 6" })
hl.bind(settings.mod .. " + code:16", hl.dsp.focus({ workspace = "7" }), { description = "Switch to workspace 7" })
hl.bind(settings.mod .. " + code:17", hl.dsp.focus({ workspace = "8" }), { description = "Switch to workspace 8" })
hl.bind(settings.mod .. " + code:18", hl.dsp.focus({ workspace = "9" }), { description = "Switch to workspace 9" })
hl.bind(settings.mod .. " + code:19", hl.dsp.focus({ workspace = "10" }), { description = "Switch to workspace 10" })

-- Move active window to a workspace with $mod + SHIFT + [1-9; 0]
hl.bind(settings.mod .. " + SHIFT + code:10", hl.dsp.window.move({ workspace = "1" }), { description = "Move window to workspace 1" })
hl.bind(settings.mod .. " + SHIFT + code:11", hl.dsp.window.move({ workspace = "2" }), { description = "Move window to workspace 2" })
hl.bind(settings.mod .. " + SHIFT + code:12", hl.dsp.window.move({ workspace = "3" }), { description = "Move window to workspace 3" })
hl.bind(settings.mod .. " + SHIFT + code:13", hl.dsp.window.move({ workspace = "4" }), { description = "Move window to workspace 4" })
hl.bind(settings.mod .. " + SHIFT + code:14", hl.dsp.window.move({ workspace = "5" }), { description = "Move window to workspace 5" })
hl.bind(settings.mod .. " + SHIFT + code:15", hl.dsp.window.move({ workspace = "6" }), { description = "Move window to workspace 6" })
hl.bind(settings.mod .. " + SHIFT + code:16", hl.dsp.window.move({ workspace = "7" }), { description = "Move window to workspace 7" })
hl.bind(settings.mod .. " + SHIFT + code:17", hl.dsp.window.move({ workspace = "8" }), { description = "Move window to workspace 8" })
hl.bind(settings.mod .. " + SHIFT + code:18", hl.dsp.window.move({ workspace = "9" }), { description = "Move window to workspace 9" })
hl.bind(settings.mod .. " + SHIFT + code:19", hl.dsp.window.move({ workspace = "10" }), { description = "Move window to workspace 10" })

-- Move active window silently to a workspace with $mod + SHIFT + ALT + [1-9; 0]
hl.bind(settings.mod .. " + SHIFT + ALT + code:10", hl.dsp.window.move({ workspace = "1", follow = false }), { description = "Move window silently to workspace 1" })
hl.bind(settings.mod .. " + SHIFT + ALT + code:11", hl.dsp.window.move({ workspace = "2", follow = false }), { description = "Move window silently to workspace 2" })
hl.bind(settings.mod .. " + SHIFT + ALT + code:12", hl.dsp.window.move({ workspace = "3", follow = false }), { description = "Move window silently to workspace 3" })
hl.bind(settings.mod .. " + SHIFT + ALT + code:13", hl.dsp.window.move({ workspace = "4", follow = false }), { description = "Move window silently to workspace 4" })
hl.bind(settings.mod .. " + SHIFT + ALT + code:14", hl.dsp.window.move({ workspace = "5", follow = false }), { description = "Move window silently to workspace 5" })
hl.bind(settings.mod .. " + SHIFT + ALT + code:15", hl.dsp.window.move({ workspace = "6", follow = false }), { description = "Move window silently to workspace 6" })
hl.bind(settings.mod .. " + SHIFT + ALT + code:16", hl.dsp.window.move({ workspace = "7", follow = false }), { description = "Move window silently to workspace 7" })
hl.bind(settings.mod .. " + SHIFT + ALT + code:17", hl.dsp.window.move({ workspace = "8", follow = false }), { description = "Move window silently to workspace 8" })
hl.bind(settings.mod .. " + SHIFT + ALT + code:18", hl.dsp.window.move({ workspace = "9", follow = false }), { description = "Move window silently to workspace 9" })
hl.bind(settings.mod .. " + SHIFT + ALT + code:19", hl.dsp.window.move({ workspace = "10", follow = false }), { description = "Move window silently to workspace 10" })

-- Control scratchpad
hl.bind(settings.mod .. " + S", hl.dsp.workspace.toggle_special("scratchpad"), { description = "Toggle scratchpad" })
hl.bind(settings.mod .. " + ALT + S", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }), { description = "Move window to scratchpad" })

-- TAB between workspaces
hl.bind(settings.mod .. " + TAB", hl.dsp.focus({ workspace = "e+1" }), { description = "Next workspace" })
hl.bind(settings.mod .. " + SHIFT + TAB", hl.dsp.focus({ workspace = "e-1" }), { description = "Previous workspace" })
hl.bind(settings.mod .. " + CTRL + TAB", hl.dsp.focus({ workspace = "previous" }), { description = "Former workspace" })

-- Move workspaces to other monitors
hl.bind(settings.mod .. " + SHIFT + ALT + LEFT", hl.dsp.workspace.move({ monitor = "l" }), { description = "Move workspace to left monitor" })
hl.bind(settings.mod .. " + SHIFT + ALT + RIGHT", hl.dsp.workspace.move({ monitor = "r" }), { description = "Move workspace to right monitor" })

-- Swap active window with the one next to it with $mod + SHIFT + arrow keys
hl.bind(settings.mod .. " + SHIFT + LEFT", hl.dsp.window.swap({ direction = "left" }), { description = "Swap window to the left" })
hl.bind(settings.mod .. " + SHIFT + RIGHT", hl.dsp.window.swap({ direction = "right" }), { description = "Swap window to the right" })
hl.bind(settings.mod .. " + SHIFT + UP", hl.dsp.window.swap({ direction = "up" }), { description = "Swap window up" })
hl.bind(settings.mod .. " + SHIFT + DOWN", hl.dsp.window.swap({ direction = "down" }), { description = "Swap window down" })

-- Cycle through applications on active workspace
hl.bind("ALT + TAB", function() hl.dispatch(hl.dsp.window.cycle_next({ next = true })); hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" })) end, { description = "Cycle to next window" })
hl.bind("ALT + SHIFT + TAB", function() hl.dispatch(hl.dsp.window.cycle_next({ next = false })); hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" })) end, { description = "Cycle to prev window" })

-- Resize active window
hl.bind(settings.mod .. " + code:20", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), { description = "Expand window left" }) -- - key
hl.bind(settings.mod .. " + code:21", hl.dsp.window.resize({ x = 100, y = 0, relative = true }), { description = "Shrink window left" }) -- = key
hl.bind(settings.mod .. " + SHIFT + code:20", hl.dsp.window.resize({ x = 0, y = -100, relative = true }), { description = "Shrink window up" })
hl.bind(settings.mod .. " + SHIFT + code:21", hl.dsp.window.resize({ x = 0, y = 100, relative = true }), { description = "Expand window down" })

-- Scrolling mode
-- Resize the active column to preset widths
-- Italian layout: use symbols that are available without Shift
hl.bind(settings.mod .. " + ALT + plus", hl.dsp.layout("colresize +conf"), { description = "Next preset column width" })
hl.bind(settings.mod .. " + ALT + egrave", hl.dsp.layout("colresize -conf"), { description = "Previous preset column width" })
hl.bind(settings.mod .. " + ALT + code:10", hl.dsp.layout("colresize 0.333"), { description = "Set column width to 33%" })
hl.bind(settings.mod .. " + ALT + code:11", hl.dsp.layout("colresize 0.5"), { description = "Set column width to 50%" })
hl.bind(settings.mod .. " + ALT + code:12", hl.dsp.layout("colresize 0.667"), { description = "Set column width to 67%" })
hl.bind(settings.mod .. " + ALT + code:13", hl.dsp.layout("colresize 0.8"), { description = "Set column width to 80%" })
hl.bind(settings.mod .. " + ALT + code:14", hl.dsp.layout("colresize 1.0"), { description = "Set column width to 100%" })
-- Fit
hl.bind(settings.mod .. " + E", hl.dsp.layout("fit active"))
hl.bind(settings.mod .. " + SHIFT + E", hl.dsp.layout("fit visible"))

-- Mouse binds
hl.bind(settings.mod .. " + mouse_up", hl.dsp.window.cycle_next({ next = true }), { description = "Scroll active window forward" })
hl.bind(settings.mod .. " + mouse_down", hl.dsp.window.cycle_next({ next = false }), { description = "Scroll active window backward" })
hl.bind(settings.mod .. " + SHIFT + mouse_up", hl.dsp.focus({ workspace = "e+1" }), { description = "Scroll active workspace forward" })
hl.bind(settings.mod .. " + SHIFT + mouse_down", hl.dsp.focus({ workspace = "e-1" }), { description = "Scroll active workspace backward" })
hl.bind(settings.mod .. " + mouse:272", hl.dsp.window.drag(), { description = "Move window", mouse = true })
hl.bind(settings.mod .. " + mouse:273", hl.dsp.window.resize(), { description = "Resize window", mouse = true })

--## APPS #######################################

hl.bind(settings.mod .. " + RETURN", hl.dsp.exec_cmd("" .. settings.term .. ""), { description = "Terminal" })
hl.bind(settings.mod .. " + SPACE", hl.dsp.exec_cmd("pkill rofi || launcher"), { description = "Launcher" })
hl.bind(settings.mod .. " + B", hl.dsp.exec_cmd("" .. settings.browser .. ""), { description = "Browser" })
hl.bind(settings.mod .. " + M", hl.dsp.exec_cmd("" .. settings.filemanager .. ""), { description = "File Manager" })
hl.bind(settings.mod .. " + ALT + M", hl.dsp.exec_cmd("" .. settings.term .. " -e yazi"), { description = "Terminal File Manager" })
hl.bind(settings.mod .. " + Backspace", hl.dsp.exec_cmd("pkill rofi || powermenu"), { description = "Power Menu" })
hl.bind("Print", hl.dsp.exec_cmd("flameshot gui"))

--## MEDIA ######################################

-- light
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -q s 5%+"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -q s 5%-"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("hyprctl hyprsunset gamma -10"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("hyprctl hyprsunset gamma +10"), { repeating = true, locked = true })

-- media
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("volume-notify mute")) --wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("volume-notify down"), { repeating = true }) --wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("volume-notify up"), { repeating = true }) --wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { repeating = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
