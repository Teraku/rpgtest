Player = class(Entity)

function Player:init(x, y)
    self.super:init(x, y)
    self.texture = love.graphics.newImage("assets/player.png")
end

function Player:update(dt)
    
    self.velocity = {0, 0}
    
    if love.keyboard.isDown("up") then
        self.velocity[2] = self.velocity[2] - 100
    end
    
    if love.keyboard.isDown("down") then
        self.velocity[2] = self.velocity[2] + 100
    end
    
    if love.keyboard.isDown("left") then
        self.velocity[1] = self.velocity[1] - 100
    end
    
    if love.keyboard.isDown("up") then
        self.velocity[1] = self.velocity[1] + 100
    end
    
end

function Player:draw()
    
    
    
end