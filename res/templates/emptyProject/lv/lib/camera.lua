--[[
    Module allowing to use camera with multiple layers to
    create parallax effect
]]
local Camera = Class:derive("Camera")

function Camera:new(p_camX, p_camY, p_scaleX, p_scaleY)
    p_scaleX = p_scaleX or 1
    p_scaleY = p_scaleY or p_scaleX
    p_camX = p_camX or 0
    p_camY = p_camY or 0

    self.pos = Vector(p_camX, p_camY)
    self.scale = Vector(p_scaleX, p_scaleY)
end

function Camera:pushActiveLayer(p_numDamping, p_boolShouldScale)
    assert(type(p_numDamping) == "number", "Damping must be of type number, got "..type(p_numDamping).." instead!")

    p_boolShouldScale = p_boolShouldScale or false

    love.graphics.push()
    if p_boolShouldScale then
        love.graphics.scale(self.scale.x/p_numDamping, self.scale.y/p_numDamping)
    end
    love.graphics.translate(-self.pos.x/p_numDamping, -self.pos.y/p_numDamping)
end

function Camera:popActiveLayer()
    love.graphics.pop()
end

function Camera:zoomTo(p_scaleX, p_scaleY)
    p_scaleX = p_scaleX or 1
    p_scaleY = p_scaleY or p_scaleX

    self.scale.x = math.lerp(self.scale.x, p_scaleX, 0.01)
    self.scale.y = math.lerp(self.scale.y, p_scaleY, 0.01)
end

function Camera:setPos(p_x, p_y)
    p_x = p_x or self.pos.x
    p_y = p_y or self.pos.y

    print(p_x, love.graphics.getWidth(), self.scale.x)

    self.pos.x = p_x - love.graphics.getWidth()/2 * self.scale.x
    self.pos.y = p_y - love.graphics.getHeight()/2 * self.scale.y
end

return Camera