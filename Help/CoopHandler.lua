-- State machine
scenes = {Start = 1, Player1 = 2, Player2 = 3, ArenaPick = 4, Fight = 5}

scene = scenes.Player1

-- Players picked Card
p1Card = table.deepcopy(card)
p2Card = table.deepcopy(card)

function CoopUpdate(dt)
    if scene == scenes.Start then UpdateStart(dt)
    elseif scene == scenes.Player1 then UpdatePlayer1(dt)
    elseif scene == scenes.Player2 then UpdatePlayer2(dt)
    elseif scene == scenes.ArenaPick then UpdateArenaPick(dt)
    elseif scene == scenes.Fight then UpdateFight(dt) end
end

function CoopDraw()
    if scene == scenes.Start then DrawStart()
    elseif scene == scenes.Player1 then DrawPlayer1()
    elseif scene == scenes.Player2 then DrawPlayer2()
    elseif scene == scenes.ArenaPick then DrawArenaPick()
    elseif scene == scenes.Fight then DrawFight() end
end