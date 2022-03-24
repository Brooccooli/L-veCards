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

PickFirst = 1

function PlayerInit()
    DeckPress()
    rerolls = 1
end

function VSInit()
    p1Effects = { [1] = { Run = FightEffects.None }, [2] = { Run = FightEffects.None }, [3] = { Run = FightEffects.None } }   
    p2Effects = { [1] = { Run = FightEffects.None }, [2] = { Run = FightEffects.None }, [3] = { Run = FightEffects.None } }   
end

function StartPlayer()
    if PickFirst == 1 then
        scene = scenes.Player1
    else
        scene = scenes.Player2
    end
end

function SetPlayer(CurrentPlayer)
    if CurrentPlayer == PickFirst then
        if CurrentPlayer == 1 then
            scene = scenes.Player2
        else
            scene = scenes.Player1
        end
    else
        scene = scenes.ArenaPick
        if PickFirst == 1 then
            PickFirst = 2
        else
            PickFirst = 1
        end
    end
end

function setCard(index)
    if scene == scenes.Player1 then
        PlayerInit()
        p1Card = index
        SetPlayer(1)
    elseif scene == scenes.Player2 then
        PlayerInit()
        p2Card = index
        SetPlayer(2)
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