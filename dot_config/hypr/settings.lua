-- Shared paths and commands. Runtime paths refer to the deployed configuration.
local source = debug.getinfo(1, "S").source
return {
    root = assert(source:match("^@(.+)/settings%.lua$"), "Cannot locate settings module"),
    config = (os.getenv("XDG_CONFIG_HOME") or (os.getenv("HOME") .. "/.config")) .. "/hypr",
    mod = "SUPER",
    term = "ghostty",
    browser = "firefox -P daily",
    filemanager = "thunar",
}
