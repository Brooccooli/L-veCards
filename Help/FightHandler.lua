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

    -- Card stats
    local p1Stat = cards[p1CardIndex][STAT]
    local p2Stat = cards[p2CardIndex][STAT]

    -- Check for area bonus
    if cards[p1CardIndex][TYPE] == stageType then
        p1Stat = p1Stat + BonusStat
    elseif cards[p2CardIndex][TYPE] == stageType then
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

    -- Check highest stat
    local result = p1Stat - p2Stat

    -- 1 = p1, -1 = p2, 0 = tie
    if result > 0 then
        return 1
    elseif result < 0 then
        return -1
    else
        return 0
    end
end