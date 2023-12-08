function scr_scareenemy() {
    var player = instance_nearest(x, y, obj_player)
    if (state != (119 << 0))
    {
        if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60))
        {
            if (sprite_index != scaredspr && state != (109 << 0) && (player.state == (92 << 0) || player.state == (21 << 0) || player.state == (16 << 0)))
            {
                state = (97 << 0)
                sprite_index = scaredspr
                if (x != player.x)
                    image_xscale = (-(sign((x - player.x))))
                scaredbuffer = 100
                if grounded
                    vsp = -5
            }
        }
    }
}