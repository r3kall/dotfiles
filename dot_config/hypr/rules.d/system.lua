-- Floating windows
hl.window_rule({ match = { tag = "floating-window" }, float = true })
hl.window_rule({ match = { tag = "floating-window" }, center = true })
hl.window_rule({ match = { tag = "floating-window" }, size = "875 600" })

hl.window_rule({ match = { class = "(bluetui|impala|wiremix|btop|org.gnome.NautilusPreviewer|org.gnome.Evince|satty|About|TUI.float|imv|mpv)" }, tag = "+floating-window" })
-- Prefer semantic matching for applications that report modal dialogs correctly.
hl.window_rule({ match = { class = "(xdg-desktop-portal-gtk|firefox|thunar|sublime_text|DesktopEditors)", modal = true }, tag = "+floating-window" })

-- Fall back to title matching for applications that do not report modal state.
hl.window_rule({ match = { class = "(thunar|sublime_text|DesktopEditors)", title = "(?i)^(open.*files?|open folder.*|save.*files?|save.*as|save|all files|choose.*|rename.*)$" }, tag = "+floating-window" })
hl.window_rule({ match = { class = "org.gnome.Calculator" }, float = true })
hl.window_rule({ match = { class = "org.gnome.Calculator" }, center = true })

-- No transparency on media windows
hl.window_rule({ match = { class = "^(zoom|vlc|mpv|org.kde.kdenlive|com.obsproject.Studio|com.github.PintaProject.Pinta|imv|org.gnome.NautilusPreviewer)$" }, opacity = "1 1" })

-- Popped window rounding
hl.window_rule({ match = { tag = "pop" }, rounding = 8 })
