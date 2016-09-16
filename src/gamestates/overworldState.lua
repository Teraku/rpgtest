require "class.Entity"
require "class.Player"
require "class.Npc"

overworldState = {}

function overworldState:init()
    
    self.world = bump.newWorld()
    self.player = Player:new(100, 100, 32, 32)
    
    self.world:add(self.player, self.player.x, self.player.y, self.player.width, self.player.height)
    
    self.entities = {}
end

function overworldState:update(dt)
    
    local playerVelocity = self.player:update(dt)
    
    self.player.x, self.player.y = self.world:move(self.player, self.player.x + playerVelocity.x, self.player.y + playerVelocity.y)
    
    for i, entity in pairs(self.entities) do
        local entityVelocity = entity:update(dt)
        entity.x, entity.y = self.world:move(entity, entity.x + entityVelocity.x, entity.y + entityVelocity.y)
    end
end

function overworldState:draw()
    push:apply("start")
    
    self.player:draw()
    
    for i, entity in pairs(self.entities) do
        entity:draw()
    end
    
    push:apply("end")
end