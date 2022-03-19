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
    
end