function _init()
end

function _update()
end

function _draw()
	cls()
	map(0,0,10,10)
	poke(0x5f2d, 1)
	spr(1,stat(32),stat(33),0.2,0.2)
end

