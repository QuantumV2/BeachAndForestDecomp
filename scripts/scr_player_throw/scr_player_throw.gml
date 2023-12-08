function scr_player_throw() {
    switch character
    {
        case "P":
            move = (key_left + key_right)
            if grounded
            {
                if (dir != xscale)
                {
                    dir = xscale
                    movespeed = 2
                    facehurt = 0
                }
                jumpstop = 0
                anger = 100
                if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
                    hsp = (move * movespeed)
                else if place_meeting(x, (y + 1), obj_railh)
                    hsp = ((move * movespeed) - 5)
                else if place_meeting(x, (y + 1), obj_railh2)
                    hsp = ((move * movespeed) + 5)
                if (move != 0)
                {
                    if (movespeed < 7)
                        movespeed += 0.5
                    else if (floor(movespeed) == 7)
                        movespeed = 7
                }
                else
                    movespeed = 0
                if (movespeed > 7)
                    movespeed -= 0.1
                if (move != 0)
                {
                    if (movespeed < 3 && move != 0)
                        image_speed = 0.35
                    else if (movespeed > 3 && movespeed < 6)
                        image_speed = 0.45
                    else
                        image_speed = 0.6
                }
                else
                    image_speed = 0.35
            }
            if (!grounded)
            {
                if (momemtum == 0)
                    hsp = (move * movespeed)
                else
                    hsp = (xscale * movespeed)
                if (move != xscale && momemtum == 1 && movespeed != 0)
                    movespeed -= 0.05
                if (movespeed == 0)
                    momemtum = 0
                if ((move == 0 && momemtum == 0) || scr_solid((x + hsp), y))
                {
                    movespeed = 0
                    mach2 = 0
                }
                if (move != 0 && movespeed < 7)
                    movespeed += 0.25
                if (movespeed > 7)
                    movespeed -= 0.05
                if ((scr_solid((x + 1), y) && move == 1) || (scr_solid((x - 1), y) && move == -1))
                    movespeed = 0
                if (dir != xscale)
                {
                    mach2 = 0
                    dir = xscale
                    movespeed = 0
                }
                if (move == (-xscale))
                {
                    mach2 = 0
                    movespeed = 0
                    momemtum = 0
                }
                landAnim = 1
                if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
                {
                    vsp /= 5
                    jumpstop = 1
                }
                if (ladderbuffer > 0)
                    ladderbuffer--
                if (scr_solid(x, (y - 1)) && jumpstop == 0 && jumpAnim == 1)
                {
                    vsp = grav
                    jumpstop = 1
                }
            }
            jumpAnim = 1
            dashAnim = 1
            landAnim = 0
            moveAnim = 1
            stopAnim = 1
            crouchslideAnim = 1
            crouchAnim = 1
            sprite_index = spr_player_throw
            if (floor(image_index) == (image_number - 1) || move == (-xscale))
                state = (0 << 0)
            break
        case "N":
            bombcharge = 0
            hsp = (xscale * movespeed)
            if (movespeed > 0)
                movespeed -= 0.5
            if (floor(image_index) == 4 && sprite_index == spr_playerN_noisebombkick && kickbomb == 0)
            {
                instance_create((x + (xscale * 20)), (y + 20), obj_bumpeffect)
                with (instance_create((x + 20), y, obj_playerbomb))
                {
                    movespeed = 10
                    kick = 1
                    sprite_index = spr_playerN_noisebombslide
                    image_xscale = other.xscale
                }
                kickbomb = 1
            }
            if (floor(image_index) == (image_number - 1))
                state = (0 << 0)
            break
    }
    
    image_speed = 0.35
}