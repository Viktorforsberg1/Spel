love.window.setTitle("Hejsan")

function love.load()

    totalwidth = 800
    totalheigh = 600

    player = {}
    player.x = 0
    player.y = 0
    player.w = 64
    player.h = 64
    player.points = 10

    enemy = {}
    enemy.x = math.random(0, 800)
    enemy.y = math.random(0, 600)
    enemy.w = 50
    enemy.h = 50

    time = 0

end

function love.update(dt)

    if player.points > 0 then
        time = time + dt
    end

    if love.keyboard.isDown("right") then
        player.x = player.x + 2
    elseif love.keyboard.isDown("left") then
        player.x = player.x - 2
    elseif love.keyboard.isDown("up") then
        player.y = player.y -2
    elseif love.keyboard.isDown("down") then
        player.y = player.y  + 2
    end

    if collision(player.x, player.y, player.w, player.h, enemy.x, enemy.y, enemy.w, enemy.h) then
        player.points = player.points - 1
        enemy.x = math.random(0, 800)
        enemy.y = math.random(0,600)

    end


    if enemy.x > 750 then
        enemy.x = enemy.x - 1
    end

    if enemy.y > 550 then
        enemy.y = enemy.y - 1
    end

end

function love.draw()
    love.graphics.rectangle("fill", enemy.x, enemy.y, enemy.w, enemy.h)
    love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
    love.graphics.print(player.points .. " Kvar", 20, 20)
    love.graphics.print(math.floor(time), 100, 20)


    if win (player.points) then
        love.graphics.print("You won!", 390, 280)
        love.graphics.print(time, 390, 300)
    end

end

function collision(ax, ay, aw, ah, bx, by, bw, bh)
    return ax < (bx + bw) and
    bx < (ax + aw) and
    ay < (by + bh) and
    by < (ay + ah)
    end

function win(a)
    return a < 1
end

