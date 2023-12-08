function scr_player_jump() {
    if (momemtum == 0)
        hsp = (move * movespeed)
    else
        hsp = (xscale * movespeed)
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 2
        facehurt = 0
    }
    if (move != xscale)
        movespeed = 2
    move = (key_left + key_right)
    if (movespeed == 0)
        momemtum = 0
    if scr_solid((x + hsp), y)
    {
        movespeed = 0
        mach2 = 0
    }
    if (move != 0)
    {
        if (movespeed < 6)
            movespeed += 0.5
        else if (floor(movespeed) == 6)
            movespeed = 6
    }
    else
        movespeed = 0
    if (movespeed > 6)
        movespeed -= 0.1
    if ((scr_solid((x + 1), y) && move == 1) || (scr_solid((x - 1), y) && move == -1))
        movespeed = 0
    if (dir != xscale)
        dir = xscale
    landAnim = 1
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 10
        jumpstop = 1
    }
    if (ladderbuffer > 0)
        ladderbuffer--
    if (scr_solid(x, (y - 1)) && jumpstop == 0 && jumpAnim == 1)
    {
        vsp = grav
        jumpstop = 1
    }
    if (move != 0)
        xscale = move
    if (character == "N" && wallclingcooldown == 10)
    {
        if (place_meeting((x + xscale), y, obj_solid) && key_jump)
        {
            scr_soundeffect(sfx_step)
            state = (83 << 0)
            sprite_index = spr_playerN_wallclingstart
            image_index = 0
            xscale *= -1
            vsp = 0
            doublejump = 0
        }
        else if (key_jump && doublejump == 0 && sprite_index != spr_freefall && sprite_index != spr_facestomp)
        {
            scr_soundeffect(sfx_woosh)
            jumpAnim = 1
            sprite_index = spr_playerN_doublejump
            image_index = 0
            jumpstop = 0
            vsp = -9
            with (instance_create(x, y, obj_highjumpcloud2))
                image_xscale = other.xscale
            doublejump = 1
        }
    }
    if (grounded && input_buffer_jump < 8 && (!key_down) && (!key_attack) && vsp > 0 && (!((sprite_index == spr_facestomp || sprite_index == spr_freefall))))
    {
        scr_soundeffect(sfx_jump)
        sprite_index = spr_jump
        if (shotgunAnim == 1)
            sprite_index = spr_shotgunjump
        instance_create(x, y, obj_highjumpcloud2)
        stompAnim = 0
        vsp = -11
        state = (66 << 0)
        jumpAnim = 1
        jumpstop = 0
        image_index = 0
        movespeed = 2
        freefallstart = 0
    }
    if (grounded && vsp > 0 && (!key_attack))
    {
        scr_soundeffect(sfx_step)
        if key_attack
            landAnim = 0
        instance_create(x, y, obj_landcloud)
        input_buffer_secondjump = 0
        state = (0 << 0)
        jumpAnim = 1
        jumpstop = 0
        image_index = 0
        freefallstart = 0
    }
    if (key_shoot2 && character == "V" && (!instance_exists(obj_dynamite)))
    {
        if (move == 0)
            movespeed = 0
        state = (2 << 0)
        image_index = 0
        sprite_index = spr_playerV_dynamitethrow
        with (instance_create(x, y, obj_dynamite))
        {
            image_xscale = other.xscale
            movespeed = 6
            vsp = -6
        }
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerV_superjump)
    {
        with (instance_create(x, (y + 25), obj_balloonpop))
            sprite_index = spr_shotgunimpact
    }
    if key_jump
        input_buffer_jump = 0
    if (vsp > 5)
        fallinganimation++
    if (fallinganimation >= 40 && fallinganimation < 80)
        sprite_index = spr_facestomp
    if (fallinganimation >= 80)
        sprite_index = spr_freefall
    if (stompAnim == 0)
    {
        if (jumpAnim == 1)
        {
        }
        if (jumpAnim == 0)
        {
            if (sprite_index == spr_playerN_doublejump)
                sprite_index = spr_playerN_doublejumpfall
            if (sprite_index == spr_airdash1)
                sprite_index = spr_airdash2
            if (sprite_index == spr_shotgunjump)
                sprite_index = spr_shotgunfall
            if (sprite_index == spr_playerV_superjump)
                sprite_index = spr_playerV_fall
            if (sprite_index == spr_jump)
                sprite_index = spr_fall
            if (sprite_index == spr_player_Sjumpstart)
                sprite_index = spr_player_Sjump
            if (sprite_index == spr_player_shotgunjump1)
                sprite_index = spr_player_shotgunjump2
            if (sprite_index == spr_shotgun_shootair)
                sprite_index = spr_shotgun_fall
        }
    }
    if (stompAnim == 1)
    {
        if (sprite_index == spr_stompprep && floor(image_index) == (image_number - 1))
            sprite_index = spr_stomp
    }
    if key_down2
    {
        if (shotgunAnim == 0)
        {
            image_index = 0
            state = (93 << 0)
            sprite_index = spr_bodyslamstart
            if (character == "P")
                vsp = -5
            else
                vsp = -7
        }
        else
        {
            scr_soundeffect(sfx_killingblow)
            image_index = 0
            state = (93 << 0)
            sprite_index = spr_shotgunjump1
            vsp = -5
            if (character == "P")
            {
                with (instance_create((x + (xscale * 30)), (y + 60), obj_shotgunbullet))
                {
                    sprite_index = sprite10391
                    spdh = -10
                    spd = 0
                }
                with (instance_create((x + (xscale * 30)), (y + 60), obj_shotgunbullet))
                {
                    sprite_index = sprite10391
                    spdh = -10
                    spd = 5
                }
                with (instance_create((x + (xscale * 30)), (y + 60), obj_shotgunbullet))
                {
                    sprite_index = sprite10391
                    spdh = -10
                    spd = -5
                }
            }
        }
    }
    image_speed = 0.35
    if (grounded && (sprite_index == spr_facestomp || sprite_index == spr_freefall))
    {
        with (obj_baddie)
        {
            if point_in_rectangle(x, y, __view_get((0 << 0), 0), __view_get((1 << 0), 0), (__view_get((0 << 0), 0) + __view_get((2 << 0), 0)), (__view_get((1 << 0), 0) + __view_get((3 << 0), 0)))
            {
                vsp = -7
                hsp = 0
            }
        }
        with (obj_camera)
        {
            shake_mag = 10
            shake_mag_acc = (30 / room_speed)
        }
        scr_soundeffect(sfx_groundpound)
        image_index = 0
        sprite_index = spr_bodyslamland
        state = (85 << 0)
    }
    if (key_slap2 && suplexmove == 0 && (character == "P" || character == "N"))
    {
        suplexmove = 1
        suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, false)
        state = (29 << 0)
        image_index = 0
        sprite_index = spr_suplexdashjumpstart
        vsp = -4
        if (character == "P")
            movespeed = 6
        else
            movespeed = 4
    }
    if (key_shoot2 && shotgunAnim == 0)
    {
        scr_soundeffect(sfx_breakdance)
        vsp = -4
        movespeed = 9
        state = (55 << 0)
        sprite_index = spr_player_breakdancestart
        breakdance = 35
        image_index = 0
        instance_create(x, y, obj_swingdinghitbox)
    }
    if (key_shoot2 && shotgunAnim == 1)
    {
        scr_soundeffect(sfx_killingblow)
        state = (46 << 0)
        with (instance_create(x, y, obj_pistoleffect))
            image_xscale = other.image_xscale
        image_index = 0
        sprite_index = spr_shotgunshoot
        if (character == "P")
        {
            instance_create((x + (image_xscale * 20)), (y + 20), obj_shotgunbullet)
            with (instance_create((x + (image_xscale * 20)), (y + 20), obj_shotgunbullet))
                spdh = 4
            with (instance_create((x + (image_xscale * 20)), (y + 20), obj_shotgunbullet))
                spdh = -4
        }
    }
    if (pogochargeactive == 1 || (pizzapepper > 0 && character == "N"))
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
    if ((!key_attack) || move != xscale)
        mach2 = 0
    if (key_attack && grounded && fallinganimation < 40 && (character == "P" || character == "V"))
    {
        if (pizzapepper == 0)
        {
            movespeed = 6
            sprite_index = spr_mach1
            jumpAnim = 1
            state = (77 << 0)
            image_index = 0
        }
        else
        {
            movespeed = 21
            sprite_index = spr_crazyrun
            jumpAnim = 1
            state = (92 << 0)
            movespeed = 20
        }
    }
    if (key_attack && character == "N" && pogochargeactive == 0 && (!key_slap2) && pizzapepper == 0)
    {
        sprite_index = spr_playerN_pogostart
        image_index = 0
        state = (38 << 0)
    }
    if (floor(image_index) == (image_number - 1))
        jumpAnim = 0
    if (key_slap2 && character == "V")
    {
        vsp = -5
        state = (1 << 0)
        image_index = 0
        sprite_index = spr_playerV_airrevolver
        image_index = 0
        instance_create((x + (image_xscale * 20)), (y + 20), obj_shotgunbullet)
        scr_soundeffect(sfx_killingblow)
    }
    if key_taunt2
    {
        scr_soundeffect(sfx_taunt)
        taunttimer = 20
        tauntstoredmovespeed = movespeed
        tauntstoredsprite = sprite_index
        tauntstoredstate = state
        state = (59 << 0)
        if (supercharged == 1)
        {
            image_index = 0
            sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4)
        }
        else
        {
            taunttimer = 20
            image_index = random_range(0, 11)
            sprite_index = spr_taunt
        }
        instance_create(x, y, obj_taunteffect)
    }
}