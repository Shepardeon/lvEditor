--[[
    Entry point for the library that will allow to use some
    functionnalities to lua/love2D
]]

-- Helper function
-- Make it so using #true returns 1 and #false returns 0
debug.setmetatable(true, {__len = function(v) return v and 1 or 0 end})

-- +--------------+
-- | MAIN MODULES |
-- +--------------+
Class = require("lv.core.class")