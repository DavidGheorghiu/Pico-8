function _init()
 player = { -- player object
  x = 20,
  y = 20
 }

 cursor = { -- cursor object
  x = stat(32),
  y = stat(33),
  click_state = 0
 }
 
 nodes = {}

 test_x = 0 ; test_y = 0
end

function _update()
 _cursor()
 --_level_one(0, 0)
end

function _draw()
 cls()
 map(0, 0, 0, 0)
 _level_one(0, 0)
 spr(1, player.x, player.y) -- player
 poke(0x5f2d, 1) -- get mouse
 spr(2, cursor.x, cursor.y) -- cursor position
	print(test_x.. ' '..test_y)
end


function _cursor()
 cursor.x = stat(32)
 cursor.y = stat(33)
 click_state = stat(34)
 if(fget(mget(cursor.x/8, cursor.y/8), 0) and click_state == 1)
  then _move()
 end
end

function _move() -- temporary
 player.x = cursor.x
 player.y = cursor.y
end

function _level_one()
 _loop_grid(0, 0)
end

function _loop_grid(grid_x, grid_y)
 for x=grid_x, grid_x + 7 do
  for y=grid_y, grid_y + 7 do
  	if(fget(mget(x, y), 0))
  		then _check_neighbours(grid_x, grid_y, x, y)  
  	end
  end
 end
end

function _check_neighbours(grid_x, grid_y, x, y)
 -- check right
 for i=x+1, 7 do
 	if(fget(mget(i, y), 0))
 		then _draw_path_x(x, y, i)
 	end
 end
 
 -- check down
 for i=y+1, 7 do
 	if(fget(mget(x, i), 0))	
 		then _draw_path_y(x, y, i)
 	end
 end
end

function _draw_path_x(x, y, next_x)
	for i=x+1, next_x-1 do
		spr(4, i*8, y*8)
	end
end

function _draw_path_y(x, y, next_y)
	for i=y+1, next_y-1 do
		spr(4, x*8, i*8)
	end
end
