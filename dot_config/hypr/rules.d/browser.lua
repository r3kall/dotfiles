-- Browser types
hl.window_rule({ match = { class = "((google-)?[cC]hrom(e|ium)|[bB]rave-browser|[mM]icrosoft-edge|Vivaldi-stable|helium)" }, tag = "+chromium-based-browser" })
hl.window_rule({ match = { class = "([fF]irefox|zen|librewolf)" }, tag = "+firefox-based-browser" })

-- Force chromium-based browsers into a tile to deal with --app bug
hl.window_rule({ match = { tag = "chromium-based-browser" }, tile = true })

-- Only a subtle opacity change, but not for video sites
hl.window_rule({ match = { tag = "chromium-based-browser" }, opacity = "1 0.97" })
hl.window_rule({ match = { tag = "firefox-based-browser" }, opacity = "1 0.97" })

-- Some video sites should never have opacity applied to them
hl.window_rule({ match = { initial_title = "((?i)(?:[a-z0-9-]+\\.)*youtube\\.com_/|app\\.zoom\\.us_/wc/home)" }, opacity = "1.0 1.0" })

hl.window_rule({ match = { tag = "firefox-based-browser", title = "^(Library)" }, float = true })
hl.window_rule({ match = { tag = "firefox-based-browser", title = "^(Library)" }, size = "900 800" })
