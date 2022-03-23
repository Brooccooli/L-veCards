ArenaTimer = -1
FightTimer = -1

function UpdateStart(dt)

end

function UpdatePlayer1(dt)
    CheckForWin()
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

-- Again, very stupid place to put variables, even if they aren't global
local hasPickedStage = false
function UpdateArenaPick(dt)
    if ArenaTimer == -1 then -- not working atm
        currentStage = stage.Load
        ArenaTimer = 6
    elseif ArenaTimer < 2 and not hasPickedStage then
        setStage()
        hasPickedStage = true
    end

    if ArenaTimer < 0 then
        scene = scenes.Fight
        hasPickedStage = false
        ArenaTimer = -1
    else
        ArenaTimer = ArenaTimer - dt
    end

end

-- Really fucking stupid place to put global variables
HaveFought = false
FightWinner = 0
function UpdateFight(dt)

    if FightTimer == -1 then
        FightTimer = 10
    end

    if FightTimer < 5 and not HaveFought then
        FightWinner = pVSp(p1Card, p2Card)
        HaveFought = true
    end

    if FightTimer < 0 then
        rerolls = 1
        FightTimer = -1
        HaveFought = false
        scene = scenes.Player1
    else
        FightTimer = FightTimer - (1 * dt)
    end

end

function CheckForWin()
    -- Player 1
    if p1Areas.dimension > 2 or p1Areas.mutant > 2 or p1Areas.monke > 2 then
        WinPlayer = 1
        scene = scenes.WinScreen
    elseif p2Areas.dimension > 2 or p2Areas.mutant > 2 or p2Areas.monke > 2 then
        WinPlayer = 2
        scene = scenes.WinScreen
    end
end