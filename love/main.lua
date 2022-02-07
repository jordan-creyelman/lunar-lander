-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')
local Lander = {}
Lander.x = 0
Lander.y=0
Lander.angle=-90
Lander.vx=0
Lander.vy=0
Lander.img = love.graphics.newImage("ship.png")
Lander.imgEngine= love.graphics.newImage("engine.png")
Lander.engineOn = false
function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  Lander.x = largeur/2
  Lander.y = hauteur/2
end

function love.update(dt)
  Lander.vy = 1
  Lander.vx =0
--  Lander.vy = Lander.vy + 0.6*dt
 if love.keyboard.isDown("right") then
   Lander.angle = Lander.angle +90*dt
 end
 if love.keyboard.isDown("left") then
   Lander.angle = Lander.angle -90*dt
 end
 if love.keyboard.isDown("up") then
   Lander.y = Lander.y -3
   Lander.engineOn = true
 else
  Lander.engineOn = false  
 end

 Lander.x = Lander.x +Lander.vx
 Lander.y = Lander.y + Lander.vy
end

function love.draw()
  love.graphics.draw(Lander.img,Lander.x,Lander.y,math.rad(Lander.angle),1,1,Lander.img:getWidth()/2,Lander.img:getHeight()/2)
  if Lander.engineOn == true then
    love.graphics.draw(Lander.imgEngine,Lander.x,Lander.y,math.rad(Lander.angle),1,1,Lander.imgEngine:getWidth()/2,Lander.imgEngine:getHeight()/2)
  end  
end