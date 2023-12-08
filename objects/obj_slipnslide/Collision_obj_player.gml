if (drop == 0)
{
    with (other.id)
    {
        var b = 1
        for (i = 0; i < (array_length_1d(transformation) - 1); i += 1)
        {
            if (state == transformation[i] && state != (87 << 0))
                b = 0
        }
        if (b == 1)
        {
            if (state == (87 << 0))
            {
                movespeed = 4
                sprite_index = spr_player_barrelslipnslide
                image_index = 0
                other.drop = 1
                other.vsp = -5
            }
            else if (other.drop == 0)
            {
                scr_losepoints()
                sprite_index = spr_slipnslide
                other.drop = 1
                other.vsp = -5
                state = (68 << 0)
                if (movespeed < 12)
                    movespeed = 12
            }
        }
    }
}
