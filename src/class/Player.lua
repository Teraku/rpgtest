Player = class(Entity)

function Player:init(x, y, width, height)
    self.super.init(self, x, y, width, height)
    self.texture = love.graphics.newImage("assets/player.png")
end

function Player:update(dt)
    
    self.velocity = {x = 0, y = 0}
    
    if love.keyboard.isDown("up") then
        self.velocity.y = self.velocity.y - self.speed * dt
    end
    
    if love.keyboard.isDown("down") then
        self.velocity.y = self.velocity.y + self.speed * dt
    end
    
    if love.keyboard.isDown("left") then
        self.velocity.x = self.velocity.x - self.speed * dt
    end
    
    if love.keyboard.isDown("right") then
        self.velocity.x = self.velocity.x + self.speed * dt
    end
    
    --If player is moving diagonally, divide x and y velocities by 1.44 (approximately the square root of 2)
    --If this is not done, diagonal movement will be faster than orthogonal movement.
    if self.velocity.x ~= 0 and self.velocity.y ~= 0 then
        self.velocity.x = self.velocity.x / 1.44
        self.velocity.y = self.velocity.y / 1.44
    end
    
    if love.keyboard.isDown("lshift") then
        self.velocity.x = self.velocity.x * 1.5
        self.velocity.y = self.velocity.y * 1.5
    end
    
    return self.velocity
end

function Player:draw()
    
    love.graphics.draw(self.texture, self.x, self.y)
    
end