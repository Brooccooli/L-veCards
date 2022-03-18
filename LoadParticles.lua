function LoadParticles()
    -- Particle test
    star = love.graphics.newImage("Assets/star.png")
    pSystem = love.graphics.newParticleSystem(star, 32)
    pSystem:setParticleLifetime(1,5)
    --this will make your particals shoot out in diffrent directions
    --this will make your particles look much better
    --you can play with the numbers to make them move in diffrent directions
    pSystem:setLinearAcceleration(-20, -1, 20, 100)
    pSystem:setSizes(1, 0.1)
    pSystem:setSpeed(-100, 100)
    pSystem:setRotation(10, 20)
end