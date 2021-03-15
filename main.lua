function love.load()
    player = {}
    player.x = 0
    player.y = 0
    player.Width = 64
    player.Height = 64

    enemy = {}
    enemy.x = 251
    enemy.y = 250
    enemy.w = 50
    enemy.h = 50

image = love.graphics.newImage("player.png")
end

function love.update(dt)
    if love.keyboard.isDown("right") then
        player.x = player.x + 2
    elseif love.keyboard.isDown("left") then
        player.x = player.x - 2
    elseif love.keyboard.isDown("up") then
        player.y = player.y -2
    elseif love.keyboard.isDown("down") then
        player.y = player.y  + 2
    end

end

function love.draw()
    
  
    love.graphics.rectangle("fill", enemy.x, enemy.y, enemy.w, enemy.h)
    love.graphics.draw(image, player.x, player.y)
    
    --love.graphics.print("gameover", 250, 250, 0)
end