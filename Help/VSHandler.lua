-- State machine
scenes = {Start = "Start", Player1 = "Player 1", Player2 = "Player 2", ArenaPick = "Arena pick", Fight = "Fight", WinScreen = "WinScreen"}

scene = scenes.Start

-- Players picked Card
p1Card = 1
p2Card = 1

-- Players controlled Areas
p1Areas = { ["mutant"] = 0; ["monke"] = 0; ["dimension"] = 0}
p2Areas = { ["mutant"] = 0, ["monke"] = 0, ["dimension"] = 0}

-- Players battle effects
AmountOfEffects = 3
p1Effects = {}
p1EffecctIndex = 1
p2EffecctIndex = 1

rerolls = 0

WinPlayer = 1

function PlayerInit()
    DeckPress()
    rerolls = 1
end

function VSInit()
    p1Effects = { [1] = { Run = FightEffects.DimBoost }, [2] = { Run = FightEffects.DimBoost }, [3] = { Run = FightEffects.DimBoost } }   
    p2Effects = { [1] = { Run = FightEffects.DimBoost }, [2] = { Run = FightEffects.DimBoost }, [3] = { Run = FightEffects.DimBoost } }   
end

function setCard(index)
    if scene == scenes.Player1 then
        PlayerInit()
        p1Card = index
        scene = scenes.Player2
    elseif scene == scenes.Player2 then
        PlayerInit()
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
    elseif scene == scenes.Fight then DrawFight() 
    elseif scene == scenes.WinScreen then DrawWinscreen(WinPlayer) end
end