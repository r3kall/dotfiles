--## AUTOSTART  ############################################
-- https://wiki.archlinux.org/title/XDG_Desktop_Portal
hl.on("hyprland.start", function()
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

	hl.exec_cmd("systemctl --user start --no-block hyprpolkitagent.service")
	hl.exec_cmd("systemctl --user start --no-block wireplumber.service")
	hl.exec_cmd("systemctl --user start --no-block pipewire.service")
	hl.exec_cmd("systemctl --user start --no-block pipewire-pulse.service")
	hl.exec_cmd("systemctl --user start --no-block waybar.service")
	hl.exec_cmd("systemctl --user start --no-block swaync.service")
	hl.exec_cmd("systemctl --user start --no-block awww.service")
	hl.exec_cmd("systemctl --user start --no-block hypridle.service")

	-- Wine/Battle.net system tray integration
	hl.exec_cmd("xembedsniproxy")
	-- hl.exec_cmd("hyprsunset")
	-- hl.exec_cmd("wl-paste --type text --watch cliphist store")
	-- hl.exec_cmd("wl-paste --type image --watch cliphist store")
	-- hl.exec_cmd("cliphist wipe")
end)
