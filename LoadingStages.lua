DOWN_SCALE = 1.1
ARENA_PIXEL_WIDTH = 1100 * DOWN_SCALE
ARENA_PIXEL_HEIGHT = 600 * DOWN_SCALE

ARENA_SIZE_WIDTH = DOWN_SCALE
ARENA_SIZE_HEIGHT = DOWN_SCALE

function LoadStages()
    stage = {}
    stage.Load = love.graphics.newImage("Assets/Arenas/ChoosingStage.png")
    stage.Crazy = love.graphics.newImage("Assets/Arenas/Crazy.png")
    stage.Desert = love.graphics.newImage("Assets/Arenas/Desert.png")
    stage.Town = love.graphics.newImage("Assets/Arenas/Town.png")

    currentStage = stage.Town
end

function setStage()
    newStage = love.math.random(1,3)
    if newStage == 1 then
        currentStage = stage.Crazy
    elseif newStage == 2 then
        currentStage = stage.Desert
    elseif newStage == 3 then
        currentStage = stage.Town
    end
end