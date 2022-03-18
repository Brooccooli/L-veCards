dofile("Input.lua")
dofile("CardFunctions.lua")
dofile("Help/MAF.lua")
dofile("LoadCards.lua")
dofile("PrintEffects.lua")
dofile("DrawCards.lua")
dofile("UI.lua")
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

    -- Particle test
    star = love.graphics.newImage("Assets/star.png")
    pSystem = love.graphics.newParticleSystem(star, 32)
    pSystem:setParticleLifetime(1,5)
    --this will make your particals shoot out in diffrent directions
    --this will make your particles look much better
    --you can play with the numbers to make them move in diffrent directions
    pSystem:setLinearAcceleration(-20, -1, 20, 100)
    pSystem:setSizes(1, 0.1)
    pSystem:setSpeed(-100, 100)
    pSystem:setRotation(10, 20)

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

    for i = slots, 1, -1 do
        cardSlots[i][WIDTH] = turnCard(cardSlots[i][WIDTH], i)

        -- if hovered
        cardSlots[i][HOVER] = MInside(cardSlots[i][X], cardSlots[i][Y])
    end
end

function love.draw()
    -- Fill screen
    love.graphics.setBackgroundColor(0.5, 0, 1)

    DrawCards()

    -- Card Deck
    for i = 10, 1, -1 do
        if MInside(deck[X], deck[Y]) then
            love.graphics.draw(cardBack, deck[X] - i, deck[Y] - i, MAX_SIZE - 0.1, MAX_SIZE, MAX_SIZE)
        else
            love.graphics.draw(cardBack, deck[X] - i, deck[Y] - i, MAX_SIZE, MAX_SIZE, MAX_SIZE)
        end
    end

    -- Particle system
    pSystem:setPosition(love.mouse.getX(), love.mouse.getY())
    px, py = pSystem:getPosition()
    love.graphics.draw(pSystem, pX, pY)
    
    Debug()
end