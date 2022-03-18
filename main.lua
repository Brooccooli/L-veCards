dofile("Input.lua")
dofile("CardFunctions.lua")
dofile("Help/MAF.lua")
dofile("LoadCards.lua")
dofile("PrintEffects.lua")
dofile("DrawCards.lua")
dofile("UI.lua")
dofile("LoadParticles.lua")
dofile("Help/UpdateHandler.lua")
dofile("Help/DrawHandler.lua")
dofile("Help/CoopHandler.lua")
dofile("Help/Debug.lua")


-- Constants
MAX_SIZE = 0.2
CARD_PIXEL_X = 784 * MAX_SIZE
CARD_PIXEL_Y = 900 * MAX_SIZE
-- Lowest width = 1000
-- Lowest height = 700
SCREEN_WIDTH = 1200
SCREEN_HEIGHT = 700


function love.load()

    LoadCards()

    LoadParticles()

    -- Window size
    love.window.setMode(SCREEN_WIDTH, SCREEN_HEIGHT)

    -- Global variables
    mouseX = 0
    mouseY = 0

    cardX = 10 
    cardY = 10

    sizeX = MAX_SIZE
    sizeY = MAX_SIZE

end

function love.update(dt)
    -- good standard
    if dt > 1 then dt = 1 end

    SetMouse()

    pSystem:update(dt)

    CoopUpdate(dt)
end

function love.draw()
    -- Fill screen
    love.graphics.setBackgroundColor(0.5, 0, 1)

    CoopDraw()

    -- Particle system
    pSystem:setPosition(love.mouse.getX(), love.mouse.getY())
    px, py = pSystem:getPosition()
    love.graphics.draw(pSystem, pX, pY)
    
    Debug()
end