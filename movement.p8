function _init()
	player={
		x=40,
		y=40
	}
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
	if(btn(0)) then player.x-=+1 end
	if(btn(1)) then player.x+=1 end
	if(btn(2)) then player.y-=1 end
	if(btn(3)) then player.y+=1 end
end
