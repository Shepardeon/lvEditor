require("lv.startup")

function love.load()

end

function love.update(dt)
    Input:update()
end

function love.draw()
    love.graphics.print("Hello World!", love.graphics.getWidth()/2, love.graphics.getHeight()/2)
end