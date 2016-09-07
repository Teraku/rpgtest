require "lib.class"

--HUMP libraries
Gamestate = require "lib.hump.gamestate"
Timer = require "lib.hump.timer"
Camera = require "lib.hump.camera"

--Push, a library for proper resolution scaling
local push = require "lib.push"

local gameWidth, gameHeight = 1440, 1080 --Should be sharp on 1920x1080 screens while still keeping 4:3.
local windowWidth, windowHeight = love.window.getDesktopDimensions()

local fullscreen = false
if fullscreen then
    push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = true})
else 
    windowWidth, windowHeight = windowWidth*.8, windowHeight*.8 --make the window a bit smaller than the screen itself
    push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = false, resizable = true})
end

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