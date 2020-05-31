--[[
    Entry point for the library that will allow to use some
    functionnalities to lua/love2D
]]

-- Helper function
require("lv.utils")

-- +--------------+
-- | MAIN MODULES |
-- +--------------+
Class = require("lv.core.class")
Vector = require("lv.maths.vector")
local InputManager = require("lv.lib.inputManager")
Input = InputManager("lv/assets/ControllerDB.txt")