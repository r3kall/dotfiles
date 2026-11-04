--## ENVIRONMENT VARIABLES  ################################
-- Cursor size
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Core Wayland
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_CLASS", "user")
hl.env("XDG_DESKTOP_PORTAL_DIR", "/usr/share/xdg-desktop-portal/portals")

-- Toolkit Wayland Support
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

hl.env("GTK_USE_PORTAL", "1")
hl.env("GDK_BACKEND", "wayland,x11")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

-- Electron / Chromium Apps
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("ELECTRON_ENABLE_WAYLAND", "1")
hl.env("OZONE_PLATFORM", "wayland")

-- Don't show update on first launch
hl.config({ ecosystem = {
    no_update_news = true,
} })

hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")
