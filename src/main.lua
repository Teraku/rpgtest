require "lib.class"
require "class.GameState"

local push = require "lib.push"

local gameWidth, gameHeight = 1440, 1080 --Should be sharp on 1920x1080 screens while still keeping 4:3.
local windowWidth, windowHeight = love.window.getDesktopDimensions()
windowWidth, windowHeight = windowWidth*.8, windowHeight*.8 --make the window a bit smaller than the screen itself

push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = false})

local subclasstestobject

function love.load(arg)
    
end

function love.update(dt)
    
end

function love.draw()
    push:apply("start")
    
    push:apply("end")
end

function love.keypressed(key, scanCode, isRepeat)
    if key == "escape" then
        love.event.quit()
    end
end

function love.resize(w, h)
    push:resize(w, h)
end