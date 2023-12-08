function scr_player_climbwall() {
    switch character
    {
        case "P":
            if (windingAnim < 200)
                windingAnim++
            move = (key_left + key_right)
            suplexmove = 0
            vsp = (-wallspeed)
            if (wallspeed < 24 && move == xscale)
                wallspeed += 0.05
            crouchslideAnim = 1
            sprite_index = spr_machclimbwall
            if (!key_attack)
            {
                state = (0 << 0)
                movespeed = 0
            }
            if (scr_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x - sign(hsp)), y, obj_slope))))
            {
                sprite_index = spr_superjumpland
                scr_soundeffect(sfx_groundpound)
                image_index = 0
                state = (94 << 0)
                machhitAnim = 0
            }
            if (!(scr_solid((x + xscale), y)))
            {
                instance_create(x, y, obj_jumpdust)
                vsp = 0
                if (movespeed >= 6)
                    state = (78 << 0)
                if (movespeed >= 12)
                {
                    state = (92 << 0)
                    sprite_index = spr_mach4
                }
            }
            if key_jump
            {
                movespeed = 8
                state = (78 << 0)
                image_index = 0
                sprite_index = spr_walljumpstart
                vsp = -11
                xscale *= -1
                jumpstop = 0
            }
            if ((grounded && wallspeed <= 0) || wallspeed <= 0)
            {
                state = (66 << 0)
                sprite_index = spr_fall
            }
            image_speed = 0.6
            if (!instance_exists(obj_cloudeffect))
                instance_create(x, (y + 43), obj_cloudeffect)
            break
        case "V":
            if (windingAnim < 200)
                windingAnim++
            move = (key_left + key_right)
            suplexmove = 0
            vsp = (-wallspeed)
            if (wallspeed < 24 && move == xscale)
                wallspeed += 0.05
            crouchslideAnim = 1
            sprite_index = spr_machclimbwall
            if (!key_attack)
            {
                state = (0 << 0)
                movespeed = 0
            }
            if (scr_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x - sign(hsp)), y, obj_slope))))
            {
                sprite_index = spr_superjumpland
                scr_soundeffect(sfx_groundpound)
                image_index = 0
                state = (94 << 0)
                machhitAnim = 0
            }
            if (!(scr_solid((x + xscale), y)))
            {
                instance_create(x, y, obj_jumpdust)
                vsp = 0
                if (movespeed >= 6)
                    state = (78 << 0)
                if (movespeed >= 12)
                {
                    state = (92 << 0)
                    sprite_index = spr_mach4
                }
            }
            if key_jump
            {
                movespeed = 8
                state = (78 << 0)
                image_index = 0
                sprite_index = spr_walljumpstart
                vsp = -11
                xscale *= -1
                jumpstop = 0
            }
            if ((grounded && wallspeed <= 0) || wallspeed <= 0)
            {
                state = (66 << 0)
                sprite_index = spr_fall
            }
            image_speed = 0.6
            if (!instance_exists(obj_cloudeffect))
                instance_create(x, (y + 43), obj_cloudeffect)
            break
        case "N":
            hsp = 0
            if (sprite_index == spr_playerN_wallclingstart && floor(image_index) == (image_number - 1))
                sprite_index = spr_playerN_wallcling
            if (sprite_index == spr_playerN_wallcling)
                vsp = 2
            else
                vsp = 0
            wallclingcooldown = 0
            if (floor(image_index) == (image_number - 1) || (!key_jump2))
            {
                vsp = -15
                state = (66 << 0)
                sprite_index = spr_playerN_jump
                image_index = 0
            }
            if key_jump
            {
                vsp = -15
                state = (66 << 0)
                sprite_index = spr_playerN_jump
                image_index = 0
            }
            image_speed = 0.35
            break
    }
}