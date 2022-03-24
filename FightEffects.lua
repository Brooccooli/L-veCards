FightEffects = {}
BoostBonus = 2

function FightEffects.None(type)
    return -1000
end

function FightEffects.DimBoost(type)
    local result = 0
    if type == DIMENSION then
        result = BoostBonus
    end
    return result
end

function FightEffects.MutBoost(type)
    local result = 0
    if type == MUTANT then
        result = BoostBonus
    end
    return result
end

function FightEffects.MonBoost(type)
    local result = 0
    if type == MONKE then
        result = BoostBonus
    end
    return result
end

function FightEffects.Why(type) 
    return -500
end

function FightEffects.Sad(type)
    result = 0
    if love.math.random(1, 20) == 5 then
        result = 200
    end
    return result
end