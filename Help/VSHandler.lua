-- State machine
scenes = {Start = "Start", Player1 = "Player 1", Player2 = "Player 2", ArenaPick = "Arena pick", Fight = "Fight"}

scene = scenes.Player1

-- Players picked Card
p1Card = 1
p2Card = 1

-- Players controlled Areas
p1Areas = {}
p1Areas["mutant"] = 0
p1Areas["monke"] = 0
p1Areas["dimension"] = 0;
p2Areas = { ["mutant"] = 0, ["monke"] = 0, ["dimension"] = 0}

rerolls = 0

function pInit()
    DeckPress()
    rerolls = 1
end

function setCard(index)
    if scene == scenes.Player1 then
        pInit()
        p1Card = index
        scene = scenes.Player2
    elseif scene == scenes.Player2 then
        pInit()
        p2Card = index
        ArenaTimer = 3
        scene = scenes.ArenaPick
    end
end

function VSUpdate(dt)
    if scene == scenes.Start then UpdateStart(dt)
    elseif scene == scenes.Player1 then UpdatePlayer1(dt)
    elseif scene == scenes.Player2 then UpdatePlayer2(dt)
    elseif scene == scenes.ArenaPick then UpdateArenaPick(dt)
    elseif scene == scenes.Fight then UpdateFight(dt) end
end

function VSDraw()
    if scene == scenes.Start then DrawStart()
    elseif scene == scenes.Player1 then DrawCardPic()
    elseif scene == scenes.Player2 then DrawCardPic()
    elseif scene == scenes.ArenaPick then DrawArenaPick()
    elseif scene == scenes.Fight then DrawFight() end
end