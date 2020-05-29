--[[
    Module adding somewhat of a class support to lua
]]

local Class = {}
Class.__index = Class

-- Default implementation; allows to create an insance
-- Should probably log this if called
function Class:new() end

-- Allows for inheritance behavior throughout the program
function Class:derive(p_strClassType) 
    assert(type(p_strClassType) == "string", "Tried to create class with p_strClassType of type "..type(p_strClassType).." instead of string!")
    local cls = {}

    cls.type    = p_strClassType
    cls.__index = cls
    cls.__call  = Class.__call
    cls.super   = self
    setmetatable(cls, self)

    return cls
end

-- Allows polymorphism through metatables
function Class:is(p_class) 
    local base = getmetatable(p_class)

    while base do
        if base == Class then return true end
        base = getmetatable(base)
    end

    return false
end

-- Allows polymorphism through the class.type parameter
function Class:isType(p_strClassType)
    if type(p_strClassType) ~= "string" then
        -- Should log this through a logger
        print("p_strClassType of type "..type(p_strClassType).." ignored.")
        return false
    end

    local base = self

    while base do
        if base.type == p_strClassType then return true end
        base = base.super
    end

    return false
end

-- Allows to create class instances without having to call the :new() function
function Class:__call(...) 
    local instance = setmetatable({}, self)
    instance:new(...)
    return instance
end

return Class