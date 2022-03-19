function DrawStart()

end

function DrawPlayer1()
    -- Fill screen
    love.graphics.setBackgroundColor(0.5, 0, 1)
    DrawCards()

    -- Card Deck
    for i = 10, 1, -1 do
        if MInside(deck[X], deck[Y]) then
            love.graphics.draw(cardBack, deck[X] - i, deck[Y] - i, MAX_SIZE - (0.05 * i), MAX_SIZE, MAX_SIZE)
        else
            love.graphics.draw(cardBack, deck[X] - i, deck[Y] - i, MAX_SIZE, MAX_SIZE, MAX_SIZE)
        end
    end
end

function DrawPlayer2()
    -- Fill screen
    love.graphics.setBackgroundColor(0.5, 0, 1)
    DrawCards()

    -- Card Deck
    for i = 10, 1, -1 do
        if MInside(deck[X], deck[Y]) then
            love.graphics.draw(cardBack, deck[X] - i, deck[Y] - i, MAX_SIZE - (0.05 * i), MAX_SIZE, MAX_SIZE)
        else
            love.graphics.draw(cardBack, deck[X] - i, deck[Y] - i, MAX_SIZE, MAX_SIZE, MAX_SIZE)
        end
    end
end

function DrawArenaPick()
    -- Fill screen
    love.graphics.setBackgroundColor(0, 0, 0)
    local midScreenX = (SCREEN_WIDTH / 2) - (ARENA_PIXEL_WIDTH / 2)
    local midScreenY = (SCREEN_HEIGHT / 2) - (ARENA_PIXEL_HEIGHT / 2)
    love.graphics.draw(currentStage, midScreenX, midScreenY, 0, ARENA_SIZE_WIDTH, ARENA_SIZE_HEIGHT)
end

function DrawFight()
    local midScreenX = (SCREEN_WIDTH / 2) - (ARENA_PIXEL_WIDTH / 2)
    local midScreenY = (SCREEN_HEIGHT / 2) - (ARENA_PIXEL_HEIGHT / 2)
    love.graphics.draw(currentStage, midScreenX, midScreenY, 0, ARENA_SIZE_WIDTH, ARENA_SIZE_HEIGHT)

    -- Card positions
    local posX1 = 50
    local posX2 = SCREEN_WIDTH - 50 - CARD_PIXEL_X
    local midX = (SCREEN_WIDTH / 2) - (CARD_PIXEL_X / 2)
    local posY = (SCREEN_HEIGHT / 2) - (CARD_PIXEL_Y / 2)

    -- Might this be good code at 4:23 am?
    if not HaveFought then
        -- prints both cards at each side of the screen
        love.graphics.draw(cardPNG[p1Card], posX1, posY, 0, MAX_SIZE, MAX_SIZE)
        love.graphics.draw(cardPNG[p2Card], posX2, posY, 0, MAX_SIZE, MAX_SIZE)
    elseif FightWinner == 1 then
        -- player 1 winner
        love.graphics.draw(cardPNG[p1Card], midX, posY, 0, MAX_SIZE, MAX_SIZE)
    elseif FightWinner == 2 then
        -- player 2 winner
        love.graphics.draw(cardPNG[p1Card], midX, posY, 0, MAX_SIZE, MAX_SIZE)
    else
        -- TIE
        love.graphics.draw(cardPNG[p1Card], midX - (CARD_PIXEL_X / 2), posY, 0, MAX_SIZE, MAX_SIZE)
        love.graphics.draw(cardPNG[p2Card], midX + (CARD_PIXEL_X / 2), posY, 0, MAX_SIZE, MAX_SIZE)
    end
end