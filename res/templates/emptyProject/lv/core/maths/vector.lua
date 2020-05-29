--[[
    TODO
    Simple Vector2D implementation. Used only as a container for now.
]]
local Vector = Class:derive("Vector")

function Vector:new(p_x, p_y)
    self.x = p_x or 0
    self.y = p_y or p_x or 0

    assert(type(self.x) == "number", "Tried to create vector with X component "..tostring(p_x).." of type "..type(p_x))
    assert(type(self.y) == "number", "Tried to create vector with Y component "..tostring(p_y).." of type "..type(p_y))
end

function Vector:toString()
    return "Vector("..self.x..", "..self.y..")"
end

return Vector