function scr_enemy_walk() {
    if (object_index != obj_pickle && object_index != obj_tank)
        hsp = (image_xscale * movespeed)
    else if (object_index == obj_pickle)
    {
        if (!walked)
        {
            hsp += (accel * sign(image_xscale))
            if (hsp < (-movespeed) || hsp > movespeed)
            {
                hsp = (movespeed * sign(image_xscale))
                walked = 1
            }
        }
        else
        {
            hsp -= (deccel * sign(image_xscale))
            if (hsp > (-deccel_threshold) && hsp < deccel_threshold)
                walked = 0
        }
    }
    else if (object_index == obj_tank)
    {
        if (slide_buffer <= 0)
            hsp = (image_xscale * movespeed)
    }
    image_speed = 0.35
    if ((scr_solid((x + 1), y) && image_xscale == 1) || (scr_solid((x - 1), y) && image_xscale == -1) || place_meeting((x + hsp), y, obj_hallway))
    {
        if (!(place_meeting((x + sign(hsp)), y, obj_slope)))
        {
            if (object_index == obj_forknight)
            {
                image_xscale *= -1
                image_index = 0
                sprite_index = spr_forknight_turn
                state = (97 << 0)
            }
            else if (object_index == obj_tank)
            {
                image_xscale *= -1
                image_index = 0
                sprite_index = turnspr
                state = (101 << 0)
            }
            else
            {
                image_xscale *= -1
                if (object_index == obj_pickle)
                    hsp = 0
            }
        }
    }
    if (object_index != obj_ancho)
    {
        if (!((scr_solid((x + (image_xscale * 15)), (y + 31)) || place_meeting((x + (image_xscale * 15)), (y + 31), obj_platform))))
        {
            if (movespeed > 0 && grounded)
            {
                if (object_index == obj_ninja)
                {
                    vsp = -11
                    image_index = 0
                    image_xscale = (-(sign((x - obj_player.x))))
                    state = (99 << 0)
                }
                else if (object_index == obj_forknight)
                {
                    image_xscale *= -1
                    image_index = 0
                    sprite_index = spr_forknight_turn
                    state = (97 << 0)
                }
                else if (object_index == obj_tank)
                {
                    image_xscale *= -1
                    image_index = 0
                    sprite_index = turnspr
                    state = (101 << 0)
                }
                else
                {
                    image_xscale *= -1
                    if (object_index == obj_pickle)
                        hsp = 0
                }
            }
        }
    }
}