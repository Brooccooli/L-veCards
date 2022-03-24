-- Constants
MAX_SIZE = 0.2
CARD_PIXEL_X = 784 * MAX_SIZE
CARD_PIXEL_Y = 900 * MAX_SIZE
-- Lowest width = 1200
-- Lowest height = 670
SCREEN_WIDTH = 1200
SCREEN_HEIGHT = 670

require('Load/UILoader')
require("Input")
require("CardFunctions")
require("Help/MAF")
require("Load/LoadCards")
require("PrintEffects")
require("DrawCards")
require("UI")
require("Load/LoadParticles")
require("Help/UpdateHandler")
require("Help/VSHandler")
require("Help/DrawHandler")
require("Load/LoadingStages")
require("Help/FightHandler")
require("Help/Debug")
require("FightEffects")


function love.load()
    LoadStages()
    UiLoad()
    LoadCards()

    LoadParticles()

    VSInit()

    PlayerInit()

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

    ClickPSystem:update(dt)

    VSUpdate(dt)
end

function love.draw()

    VSDraw()

    -- Particle system
    ClickPSystem:setPosition(love.mouse.getX(), love.mouse.getY())
    px, py = ClickPSystem:getPosition()
    love.graphics.draw(ClickPSystem, pX, pY)
    
    Debug()
end