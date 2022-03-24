function LoadParticles()
    -- Particle test
    star = love.graphics.newImage("Assets/Particles/star.png")

    EffectParticles = {}
    EffectParticles.DimBoost = love.graphics.newImage("Assets/Particles/DimBoost.png")
    EffectParticles.MutBoost = love.graphics.newImage("Assets/Particles/MutBoost.png")
    EffectParticles.MonBoost = love.graphics.newImage("Assets/Particles/MonBoost.png")
    EffectParticles.Dice = love.graphics.newImage("Assets/Particles/Dice.png")
    EffectParticles.Why = love.graphics.newImage("Assets/Particles/Why.png")

    -- Click Settings
    ClickPSystem = love.graphics.newParticleSystem(star, 100)
    ClickPSystem:setParticleLifetime(1,2)
    ClickPSystem:setLinearAcceleration(-20, -1, 20, 100)
    ClickPSystem:setSizes(1, 0.1)
    ClickPSystem:setSpeed(-100, 100)
    ClickPSystem:setRotation(10, 20)
end