function love.load()
  xBorder = 50
  yBorder = 50
  wBorder = 1600
  hBorder = 700
  
  circles = {}
  
  for i=1,50 do
    circle = {}
    circle.x = love.math.random(60, 1200)
    circle.y = love.math.random(60, 500)
    circle.radius = 10
    circle.mode = "line"
    circle.Xspeed = love.math.random(-2, 2)
    circle.Yspeed = love.math.random(-2, 2)
    if circle.Xspeed == 0 and circle.Yspeed == 0 then
      circle.Xspeed = 2
      circle.Yspeed = 1
    end
    
    table.insert(circles, circle)
  end
  
  circle = {}
    circle.x = love.math.random(60, 1200)
    circle.y = love.math.random(60, 500)
    circle.radius = 10
    circle.mode = "fill"
    circle.Xspeed = love.math.random(-5, 5)
    circle.Yspeed = love.math.random(-5, 5)
    if circle.Xspeed == 0 and circle.Yspeed == 0 then
      circle.Xspeed = 2
      circle.Yspeed = 1
    end
    
    table.insert(circles, circle)
  
end

function love.update(dt)
  for i,c in ipairs(circles) do
    
    for ci,cc in ipairs(circles) do
      if math.abs(c.x - cc.x) <= c.radius and math.abs(c.y - cc.y) <= c.radius and cc.mode == "fill" then
        c.mode = "fill"
      end
    end
    
    c.x = c.x + c.Xspeed
    c.y = c.y + c.Yspeed
    if c.x >= xBorder + wBorder - c.radius or c.x - c.radius <= xBorder then
      c.Xspeed = -c.Xspeed
    end
    if c.y >= yBorder + hBorder - c.radius or c.y - c.radius <= yBorder then
      c.Yspeed = -c.Yspeed
    end
  end
end


function love.draw()
  love.graphics.rectangle("line", xBorder, yBorder, wBorder, hBorder)
  
  for i,c in ipairs(circles) do
    love.graphics.circle(c.mode, c.x, c.y, c.radius)
  end
  
end
