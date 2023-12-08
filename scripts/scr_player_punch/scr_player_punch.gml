function scr_player_punch() {
    switch character
    {
        case "P":
            hsp = (xscale * movespeed)
            move = (key_left + key_right)
            jumpstop = 0
            if (sprite_index == spr_player_breakdancesuper && key_shoot2)
                movespeed = 14
            if (movespeed > 0 && sprite_index == spr_player_breakdance && grounded)
                movespeed -= 0.5
            if (movespeed > 0 && sprite_index == spr_player_breakdancesuper)
                movespeed -= 0.25
            if (place_meeting((x + xscale), y, obj_solid) && (sprite_index == spr_player_breakdancestart || sprite_index == spr_player_breakdance))
                movespeed = 0
            if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_breakdancestart)
                sprite_index = spr_player_breakdance
            if (key_shoot2 && move == xscale && sprite_index == spr_player_breakdance)
            {
                image_index = 0
                sprite_index = spr_player_buttattackstart
                movespeed = 16
                vsp = -5
                if (!instance_exists(crazyruneffectid))
                {
                    with (instance_create(x, y, obj_crazyrunothereffect))
                    {
                        playerid = other.object_index
                        other.crazyruneffectid = id
                    }
                }
            }
            if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_buttattackstart)
                sprite_index = spr_player_buttattack
            if (grounded && sprite_index == spr_player_buttattack)
                sprite_index = spr_player_buttattackend
            if (sprite_index == spr_player_buttattackend)
                movespeed -= 0.25
            if (key_shoot2 && sprite_index == spr_player_breakdance && move == 0)
            {
                sprite_index = spr_player_breakdancesuper
                movespeed = 12
            }
            if (breakdance > 0)
                breakdance--
            landAnim = 0
            if (movespeed <= 0 && (sprite_index == spr_player_breakdancesuper || sprite_index == spr_player_buttattackend))
                state = (0 << 0)
            if (breakdance <= 0 && sprite_index == spr_player_breakdance)
                state = (0 << 0)
            if (place_meeting((x + xscale), y, obj_solid) && sprite_index == spr_player_breakdancesuper)
                xscale *= -1
            if (sprite_index == spr_player_breakdancesuper)
                image_speed = (movespeed / 24)
            else
                image_speed = 0.4
            if (sprite_index == spr_player_buttattack || sprite_index == spr_player_buttattackstart || sprite_index == spr_player_buttattackend)
            {
                if (scr_solid((x + 1), y) && xscale == 1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))))
                {
                    scr_soundeffect(sfx_bumpwall)
                    grav = 0.5
                    movespeed = 0
                    state = (80 << 0)
                    hsp = -2.5
                    vsp = -3
                    mach2 = 0
                    image_index = 0
                    machslideAnim = 1
                    machhitAnim = 0
                    instance_create((x + 10), (y + 10), obj_bumpeffect)
                }
                if (scr_solid((x - 1), y) && xscale == -1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))))
                {
                    scr_soundeffect(sfx_bumpwall)
                    grav = 0.5
                    movespeed = 0
                    state = (80 << 0)
                    hsp = 2.5
                    vsp = -3
                    mach2 = 0
                    image_index = 0
                    machslideAnim = 1
                    machhitAnim = 0
                    instance_create((x - 10), (y + 10), obj_bumpeffect)
                }
            }
            if ((!instance_exists(obj_dashcloud2)) && grounded && movespeed > 5)
            {
                with (instance_create(x, y, obj_dashcloud2))
                    image_xscale = other.xscale
            }
            break
        case "N":
            hsp = (xscale * movespeed)
            move = (key_left + key_right)
            momemtum = 1
            dir = xscale
            if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
            {
                vsp /= 10
                jumpstop = 1
            }
            if (key_slap2 && character == "N")
            {
                state = (49 << 0)
                sprite_index = spr_playerN_noisebombthrow
                image_index = 0
                with (instance_create((x + hsp), y, obj_playerbomb))
                {
                    movespeed = (other.movespeed + 2)
                    vsp = -5
                    image_xscale = other.xscale
                    if scr_solid(x, y)
                    {
                        x = other.x
                        y = other.y
                    }
                }
            }
            if (move != xscale && move != 0)
                state = (0 << 0)
            if (floor(image_index) == (image_number - 1))
                state = (0 << 0)
            if (movespeed > 0)
                movespeed -= 0.35
            if (pogochargeactive == 1)
            {
                if key_attack2
                {
                    scr_soundeffect(sfx_noisewoah)
                    state = (73 << 0)
                    image_index = 0
                    if (!key_up)
                        sprite_index = spr_playerN_jetpackstart
                    else
                        sprite_index = spr_superjumpprep
                    hsp = 0
                    vsp = 0
                }
            }
            landAnim = 0
            if (key_down && grounded && vsp > 0)
            {
                grav = 0.5
                sprite_index = spr_crouchslip
                machhitAnim = 0
                state = (76 << 0)
                movespeed = 15
            }
            if key_jump
                input_buffer_jump = 0
            if (grounded && input_buffer_jump < 8)
            {
                scr_soundeffect(sfx_jump)
                instance_create(x, y, obj_highjumpcloud2)
                vsp = -9
            }
            if (scr_solid((x + 1), y) && xscale == 1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))))
            {
                scr_soundeffect(sfx_bumpwall)
                grav = 0.5
                movespeed = 0
                state = (80 << 0)
                hsp = -2.5
                vsp = -3
                mach2 = 0
                image_index = 0
                machslideAnim = 1
                machhitAnim = 0
                instance_create((x + 10), (y + 10), obj_bumpeffect)
            }
            if (scr_solid((x - 1), y) && xscale == -1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))))
            {
                scr_soundeffect(sfx_bumpwall)
                grav = 0.5
                movespeed = 0
                state = (80 << 0)
                hsp = 2.5
                vsp = -3
                mach2 = 0
                image_index = 0
                machslideAnim = 1
                machhitAnim = 0
                instance_create((x - 10), (y + 10), obj_bumpeffect)
            }
            if (key_attack2 && character == "N" && pogochargeactive == 0)
            {
                sprite_index = spr_playerN_pogostart
                image_index = 0
                state = (38 << 0)
                pogospeed = 8
            }
            if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 5)
            {
                with (instance_create(x, y, obj_slidecloud))
                    image_xscale = other.xscale
            }
            image_speed = 0.35
            break
    }
}