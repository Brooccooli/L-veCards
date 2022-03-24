p1EndStat = 0
p2EndStat = 0

function pVSp(p1CardIndex, p2CardIndex)
    -- Bonus stat
    local BonusStat = 3

    -- Type of stage
    local stageType = MONKE
    if currentStage == stage.Crazy then
        stageType = DIMENSION
    elseif currentStage == stage.Desert then
        stageType = MUTANT
    end

    -- Add card effects to array
    if cards[p1CardIndex][EFFECTS].Run(MONKE) ~= -1000 then
        p1Effects[p1EffecctIndex] = {Run = cards[p1CardIndex][EFFECTS].Run}
        p1EffecctIndex = p1EffecctIndex + 1
        if p1EffecctIndex > 3 then p1EffecctIndex = 1 end
    end
    if cards[p2CardIndex][EFFECTS].Run(MONKE) ~= -1000 then
        p2Effects[p2EffecctIndex] = {Run = cards[p2CardIndex][EFFECTS].Run}
        p2EffecctIndex = p2EffecctIndex + 1
        if p2EffecctIndex > 3 then p2EffecctIndex = 1 end
    end

    -- Card stats
    p1Stat = cards[p1CardIndex][STAT]
    p2Stat = cards[p2CardIndex][STAT]

    -- Check for area bonus
    if cards[p1CardIndex][TYPE] == stageType then
        p1Stat = p1Stat + BonusStat
    end
    if cards[p2CardIndex][TYPE] == stageType then
        p2Stat = p2Stat + BonusStat
    end

    -- Matchup bonus ## MADE VERY BAD IT'S FUCKING 3 AM AND I'M TOO TIRED TO DO IT PROBABLY
    -- always use tables, why not use tables, no tables = bad
    -- pls rework this if you continue to work on this game
    -- player 1
    if cards[p1CardIndex][TYPE] == MONKE and cards[p2CardIndex][TYPE] == DIMENSION then
        p1Stat = p1Stat + BonusStat
    elseif cards[p1CardIndex][TYPE] == DIMENSION and cards[p2CardIndex][TYPE] == MUTANT then
        p1Stat = p1Stat + BonusStat
    elseif cards[p1CardIndex][TYPE] == MUTANT and cards[p2CardIndex][TYPE] == MONKE then
        p1Stat = p1Stat + BonusStat
    end

    -- player 2
    if cards[p2CardIndex][TYPE] == MONKE and cards[p1CardIndex][TYPE] == DIMENSION then
        p2Stat = p2Stat + BonusStat
    elseif cards[p2CardIndex][TYPE] == DIMENSION and cards[p1CardIndex][TYPE] == MUTANT then
        p2Stat = p2Stat + BonusStat
    elseif cards[p2CardIndex][TYPE] == MUTANT and cards[p1CardIndex][TYPE] == MONKE then
        p2Stat = p2Stat + BonusStat
    end

    -- Apply Effects
    local willSwitchStats = false
    for i = AmountOfEffects, 1, -1 do
        local effect1 = p1Effects[1].Run(cards[p1CardIndex][TYPE]) 
        local effect2 = p2Effects[1].Run(cards[p2CardIndex][TYPE]) 

        if effect1 == -500 or effect2 == -500 then
            willSwitchStats = true
        else
            if effect1 ~= -1000 then
                p1Stat = p1Stat + effect1
            end
            if effect2 ~= -1000 then
                p2Stat = p2Stat + effect2
            end
        end
    end

    -- Switch stats
    if willSwitchStats then
        local statTemp = p1Stat
        p1Stat = p2Stat
        p2Stat = statTemp
    end

    -- Debugging stuff
    p1EndStat = p1Stat
    p2EndStat = p2Stat

    -- Check highest stat
    local result = p1Stat - p2Stat

    -- Creep god matchup
    if GodCheck(p1CardIndex, p2CardIndex) ~= 0 then
        result = GodCheck(p1CardIndex, p2CardIndex)
    end

    -- Return who won
    -- 1 = p1, -1 = p2, 0 = tie
    if result > 0 then
        p1Areas[stageType] = p1Areas[stageType] + 1
        return 1
    elseif result < 0 then
        p2Areas[stageType] = p2Areas[stageType] + 1
        return -1
    else
        return 0
    end
end

-- Checks if one player has god card and the other player has creep
function GodCheck(p1CardIndex, p2CardIndex)
    if p1CardIndex == 1 and p2CardIndex == 3 then
        return 1
    elseif p1CardIndex == 3 and p2CardIndex == 1 then
        return -1
    end

    return 0
end