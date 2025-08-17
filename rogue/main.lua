-- Get screen size
height = love.graphics.getHeight()
width = love.graphics.getWidth()

local tilesize = 32
local mapHeight = 20  -- en tiles
local mapWidth = 25   -- en tiles

local textures = {}
local map = {} -- el mapa global

-- Generador de mapa
function map_generator()
    local m = {}
    local probWater = 0.1 -- 20% de agua

    for y = 1, mapHeight do
        m[y] = {}
        for x = 1, mapWidth do
            if math.random() < probWater then
                m[y][x] = 2 -- agua
            else
                m[y][x] = 1 -- pasto
            end
        end
    end

    return m
end

function love.load()
    playerImage = love.graphics.newImage("player.png")
    textures[1] = love.graphics.newImage("grass.png")
    textures[2] = love.graphics.newImage("water.png")

    player = {
        x = width / 2,
        y = height / 2,
        step = 10
    }

    moveDelay = 0.1
    moveTimer = 0

    -- Generamos el mapa una vez
    map = map_generator()
end

function love.update(dt)
    movement(dt)
end

function love.draw()
    for y = 1, #map do
        for x = 1, #map[y] do
            local tileType = map[y][x]
            local texture = textures[tileType]

            if texture then
                love.graphics.draw(texture, (x - 1) * tilesize, (y - 1) * tilesize)
            else
                love.graphics.print("?", (x - 1) * tilesize, (y - 1) * tilesize)
            end
        end
    end

    love.graphics.draw(playerImage, player.x, player.y)
end

function movement(dt)
    if moveTimer <= 0 then
        if love.keyboard.isDown("w") then
            player.y = player.y - player.step
            moveTimer = moveDelay
        end
        if love.keyboard.isDown("s") then
            player.y = player.y + player.step
            moveTimer = moveDelay
        end
        if love.keyboard.isDown("d") then
            player.x = player.x + player.step
            moveTimer = moveDelay
        end
        if love.keyboard.isDown("a") then
            player.x = player.x - player.step
            moveTimer = moveDelay
        end
    end
    if moveTimer > 0 then
        moveTimer = moveTimer - dt
    end
end
