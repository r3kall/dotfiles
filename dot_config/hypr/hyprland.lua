--  _   _                  _                 _
-- | | | |                | |               | |
-- | |_| |_   _ _ __  _ __| | __ _ _ __   __| |
-- |  _  | | | | '_ \| '__| |/ _` | '_ \ / _` |
-- | | | | |_| | |_) | |  | | (_| | | | | (_| |
-- \_| |_/\__, | .__/|_|  |_|\__,_|_| |_|\__,_|
--         __/ | |
--        |___/|_|
-- See https://wiki.hypr.land/Configuring/


-- Resolve modules beside this entry point, both in staging and after deployment.
local source = debug.getinfo(1, "S").source
local root = assert(source:match("^@(.+)/[^/]+$"), "Cannot locate Hyprland configuration")
package.path = root .. "/?.lua;" .. package.path

local settings = require("settings")
require(settings.root .. "/conf.d/env")
require(settings.root .. "/conf.d/autostart")
require(settings.root .. "/conf.d/bindings")
require(settings.root .. "/conf.d/monitors")
require(settings.root .. "/conf.d/look")
require(settings.root .. "/conf.d/input")
require(settings.root .. "/conf.d/rules")
