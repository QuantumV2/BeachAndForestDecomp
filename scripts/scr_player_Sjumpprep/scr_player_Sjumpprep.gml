function scr_player_Sjumpprep() {
    switch character
    {
        case "P":
            combo = 0
            mach2 = 0
            move = (key_left + key_right)
            if (sprite_index == spr_superjumpprep)
            {
                if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
                    hsp = (xscale * movespeed)
                else if place_meeting(x, (y + 1), obj_railh)
                    hsp = ((xscale * movespeed) - 5)
                else if place_meeting(x, (y + 1), obj_railh2)
                    hsp = ((xscale * movespeed) + 5)
                if (movespeed >= 0)
                    movespeed -= 0.25
            }
            if (sprite_index == spr_superjumppreplight || sprite_index == spr_snick_superjumplight || sprite_index == spr_superjumpright || sprite_index == spr_superjumpleft)
            {
                if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
                    hsp = (move * 2)
                else if place_meeting(x, (y + 1), obj_railh)
                    hsp = ((move * 2) - 5)
                else if place_meeting(x, (y + 1), obj_railh2)
                    hsp = ((move * 2) + 5)
            }
            if (character == "S")
            {
                if (floor(image_index) == (image_number - 1) && sprite_index == spr_snick_superjumpprep)
                    sprite_index = spr_snick_superjumplight
                if (move != 0)
                    xscale = move
            }
            if (sprite_index != spr_superjumpprep)
            {
                if (sign(hsp) == 0)
                    sprite_index = spr_superjumppreplight
                if (sign(hsp) == 1)
                {
                    if (xscale == 1)
                        sprite_index = spr_superjumpright
                    if (xscale == -1)
                        sprite_index = spr_superjumpleft
                }
                if (sign(hsp) == -1)
                {
                    if (xscale == 1)
                        sprite_index = spr_superjumpleft
                    if (xscale == -1)
                        sprite_index = spr_superjumpright
                }
            }
            start_running = 1
            alarm[4] = 14
            jumpAnim = 1
            dashAnim = 1
            landAnim = 0
            machslideAnim = 1
            moveAnim = 1
            stopAnim = 1
            crouchslideAnim = 1
            crouchAnim = 1
            if (floor(image_index) == (image_number - 1) && sprite_index == spr_superjumpprep)
                sprite_index = spr_superjumppreplight
            if ((!key_up) && grounded && (character == "S" || sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpleft || sprite_index == spr_superjumpright) && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
            {
                scr_soundeffect(sfx_superjumprelease)
                instance_create(x, y, obj_explosioneffect)
                sprite_index = spr_superjump
                state = (71 << 0)
                vsp = -17
                image_index = 0
            }
            image_speed = 0.35
            break
        case "N":
            hsp = 0
            vsp = 0
            pogochargeactive = 0
            pogocharge = 50
            if (floor(image_index) == (image_number - 1))
            {
                if (sprite_index == spr_playerN_jetpackstart)
                {
                    if (pizzapepper == 0)
                    {
                        state = (92 << 0)
                        sprite_index = spr_playerN_jetpackboost
                        instance_create(x, y, obj_jumpdust)
                        movespeed = 15
                    }
                    else
                    {
                        state = (92 << 0)
                        sprite_index = spr_crazyrun
                        instance_create(x, y, obj_jumpdust)
                        movespeed = 21
                    }
                }
                else if (sprite_index == spr_superjumpprep)
                {
                    scr_soundeffect(sfx_superjumprelease)
                    instance_create(x, y, obj_explosioneffect)
                    sprite_index = spr_superjump
                    state = (71 << 0)
                    vsp = -15
                }
            }
            if (sprite_index == spr_playerN_jetpackstart)
                image_speed = 0.5
            else
                image_speed = 0.3
            break
    }
    
    if (!audio_is_playing(superjumpholdsnd))
        superjumpholdsnd = audio_play_sound(sfx_superjumphold, 1, false)
}