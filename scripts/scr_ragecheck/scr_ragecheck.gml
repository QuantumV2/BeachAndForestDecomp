function scr_ragecheck() {
    var player = instance_nearest(x, y, obj_player)
    if (state != (119 << 0) && state != (109 << 0))
    {
        if (player.x > (x - 200) && player.x < (x + 200) && y <= (player.y + 60) && y >= (player.y - 60))
        {
            if (state != (96 << 0) && ragebuffer == 0)
            {
                state = (96 << 0)
                sprite_index = ragespr
                if (x != player.x)
                    image_xscale = (-(sign((x - player.x))))
                ragebuffer = 100
                image_index = 0
                movespeed = 0
                image_speed = 0.5
            }
        }
    }
    if (ragebuffer > 0)
        ragebuffer--
}