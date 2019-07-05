function _init()
	player={
		x=20,
		y=100
	}
	dx=0 ; dy=0
end

function _update()
	movement()
end

function _draw()
	cls()
	map(0,0,10,10)
	spr(1,player.x,player.y)
end

function movement()
	dx=0 ; dy=0
	if(btn(0)) then dx=-1 end
	if(btn(1)) then dx=1 end
	if(btn(2)) then dy=-1 end
	if(btn(3)) then dy=1 end
	
	if(map_collision(player.x+dx,player.y,9,9))
		then dx=0
	end
	
	if(map_collision(player.x,player.y+dy,9,9))
		then dy=0
	end
	
	player.x += dx ; player.y += dy
end

function map_collision(x,y,w,h)
	for i=x,x+w,w do
		if(fget(mget(i/8,y/8),0) or fget(mget(i/8,(y+h)/8),0))
			then return true
		end
	end
	return false
end
