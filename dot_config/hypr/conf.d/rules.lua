local settings = require("settings")

-- See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })

-- Just dash of opacity by default
hl.window_rule({ match = { class = ".*" }, opacity = "0.97 0.9" })

-- App-specific tweaks
require(settings.root .. "/rules.d/browser")
require(settings.root .. "/rules.d/terminal")
require(settings.root .. "/rules.d/system")
require(settings.root .. "/rules.d/qemu")
require(settings.root .. "/rules.d/rofi")
require(settings.root .. "/rules.d/steam")
