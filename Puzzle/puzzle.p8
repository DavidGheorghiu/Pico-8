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
end

function _update()
    _cursor()
end

function _draw()
	cls()
	map(0, 0, 10, 10) -- map
    spr(1, player.x, player.y) -- player
    poke(0x5f2d, 1) -- get mouse
    spr(2, cursor.x, cursor.y) -- cursor position
end

function _cursor()
    cursor.x = stat(32)
    cursor.y = stat(33)
    click_state = stat(34)
     if(fget(mget(cursor.x/8, cursor.y/8), 0) and click_state == 1)
         then return -- do something
     end
end

