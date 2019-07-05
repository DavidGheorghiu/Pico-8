function _init()
	player={
		x=21,
		y=101
	}
	dx=0 ; dy=0
end

function _update()
	movement()
end

function _draw()
	cls()
	map(0,0,0,0)
	spr(1,player.x,player.y)
end

function movement()
 dx=0 ; dy=0 -- stop moving when you let go of movement keys
	if(btn(0)) then dx=-1 end -- x-axis movement
	if(btn(1)) then dx=1 end
	if(btn(2)) then dy=-1 end -- y-axis movement
	if(btn(3)) then dy=1 end
	
	if(collision(player.x+dx,player.y,7,7)) -- check x-axis collision
		then dx=0
	end
	
	if(collision(player.x,player.y+dy,7,7)) -- check y-axis collsiion
		then dy=0
	end
	
	player.x+=dx ; player.y+=dy
end

function collision(x,y,w,h)
	for i=x,x+w,w do
		if(fget(mget(i/8,y/8),0) or
				fget(mget(i/8,(y+h)/8),0))
				 then return true
		end
	end
	return false
end