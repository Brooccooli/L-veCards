ArenaFrames = 0

function UpdateStart(dt)

end

function UpdatePlayer1(dt)
    for i = slots, 1, -1 do
        cardSlots[i][WIDTH] = turnCard(cardSlots[i][WIDTH], i)

        -- if hovered
        cardSlots[i][HOVER] = MInside(cardSlots[i][X], cardSlots[i][Y])
    end
end

function UpdatePlayer2(dt)
    for i = slots, 1, -1 do
        cardSlots[i][WIDTH] = turnCard(cardSlots[i][WIDTH], i)

        -- if hovered
        cardSlots[i][HOVER] = MInside(cardSlots[i][X], cardSlots[i][Y])
    end
end

function UpdateArenaPick(dt)
    if ArenaFrames == 3 then
        currentStage = stage.Load
    else
        wait(2)
        if ArenaFrames == 2 then
            setStage()
        end
    end

    if ArenaFrames < 1 then
        scene = scenes.Fight
    end
    ArenaFrames = ArenaFrames - 1
end

function UpdateFight(dt)
    
end