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

 level = 1
 current_level = 0
 test = 0
end

function _update()
 _cursor()
end

function _draw()
 cls()
 _load_level(level)
 spr(1, player.x, player.y)
 poke(0x5f2d, 1) -- get mouse
 spr(2, cursor.x, cursor.y) -- cursor position
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
 for x=grid_x, grid_x + 15 do
  for y=grid_y, grid_y + 15 do
  	if(fget(mget(x, y), 0))
  		then _check_neighbours(grid_x, grid_y, x, y)  
  	end
  end
 end
end

function _check_neighbours(grid_x, grid_y, x, y)
 -- check right
 right_found = false
 down_found = false
 for i=x+1, 15 do
 	if(fget(mget(i, y), 0) and right_found == false)
 		then _draw_path_x(x, y, i) right_found = true
 	end
 end
 
 -- check down
 for i=y+1, 15 do
 	if(fget(mget(x, i), 0) and down_found == false)	
 		then _draw_path_y(x, y, i) ; down_found = true
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

-- todo: needs more work
function _player_spawn(grid_x, grid_y)
	for i=grid_x, grid_x + 15 do
		for j=grid_y, grid_y + 15 do
		 if(fget(mget(i, j), 1))
		 	then player.x = i*8 ; player.y = j*8
		 end
		end
	end
end

function _load_level(level)
	if(level == 1) then
		map(0, 0, 0, 0)
		_level_one(0, 0)
	end
	
	if(current_level ~= level)
		then _player_spawn(0, 0)
	end
	current_level = level
end
