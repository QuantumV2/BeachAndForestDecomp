if ((!instance_exists(baddieID)) && room != custom_lvl_room)
    instance_destroy()
if instance_exists(baddieID)
{
    x = baddieID.x
    y = baddieID.y
    image_xscale = baddieID.image_xscale
}
if (instance_exists(baddieID) && place_meeting(x, y, obj_player1) && obj_player1.cutscene == 0 && obj_player1.state != (10 << 0))
{
    if (baddieID.state != (119 << 0))
    {
        with (obj_player1)
        {
            if (instance_exists(other.baddieID) && instakillmove == 1 && other.baddieID.state != (119 << 0) && other.baddieID.thrown == 0 && (!other.baddieID.invincible) && other.baddieID.instantkillable)
            {
                if (state == (92 << 0) && sprite_index != spr_mach3hit && (character == "P" || character == "V"))
                {
                    if (fightball == 0)
                        sprite_index = spr_mach3hit
                    image_index = 0
                }
                if (state == (78 << 0) && grounded)
                {
                    machpunchAnim = 1
                    image_index = 0
                    if (other.baddieID.object_index == obj_treasureguy)
                    {
                        sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch)
                        image_index = 0
                        state = (65 << 0)
                        movespeed = 3
                        vsp = -3
                    }
                }
                if (state == (92 << 0) || (state == (82 << 0) && freefallsmash > 10))
                    other.baddieID.hp = 0
                if (state != (81 << 0))
                    other.baddieID.grabbedby = 1
                else
                    other.baddieID.grabbedby = 2
                scr_soundeffect(sfx_punch)
                instance_destroy(other.baddieID)
                global.hit += 1
                global.combotime = 60
                if ((!grounded) && state != (82 << 0) && key_jump2)
                {
                    if (state == (78 << 0) || (state == (92 << 0) && fightball == 0))
                        sprite_index = spr_mach2jump
                    suplexmove = 0
                    vsp = -11
                }
            }
            if (instance_exists(other.baddieID) && y < other.baddieID.y && attacking == 0 && sprite_index != spr_player_mach2jump && ((state == (3 << 0) && vsp > 0) || state == (66 << 0) || state == (77 << 0) || state == (54 << 0)) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep && (!other.baddieID.invincible) && other.baddieID.stompable)
            {
                scr_soundeffect(sfx_stompenemy)
                if (x != other.baddieID.x)
                    other.baddieID.image_xscale = (-(sign((other.baddieID.x - x))))
                image_index = 0
                other.baddieID.state = (109 << 0)
                if (other.baddieID.stunned < 100)
                    other.baddieID.stunned = 100
                if key_jump2
                {
                    instance_create(x, (y + 50), obj_stompeffect)
                    stompAnim = 1
                    other.baddieID.image_index = 0
                    vsp = -14
                    if (state == (66 << 0))
                        sprite_index = spr_stompprep
                }
                else
                {
                    instance_create(x, (y + 50), obj_stompeffect)
                    stompAnim = 1
                    other.baddieID.image_index = 0
                    vsp = -9
                    if (state == (66 << 0))
                        sprite_index = spr_stompprep
                }
            }
            if (place_meeting(x, (y + 1), other.id) && state == (38 << 0) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_playerN_pogobounce)
            {
                switch pogochargeactive
                {
                    case 0:
                        pogospeedprev = 0
                        other.baddieID.vsp = -3
                        scr_soundeffect(sfx_stompenemy)
                        other.baddieID.state = (109 << 0)
                        if (other.baddieID.stunned < 100)
                            other.baddieID.stunned = 100
                        sprite_index = spr_playerN_pogobounce
                        break
                    case 1:
                        pogospeedprev = 0
                        scr_throwenemy()
                        sprite_index = spr_playerN_pogobouncemach
                        break
                }

                instance_create(x, (y + 50), obj_stompeffect)
                image_index = 0
                movespeed = 0
                vsp = 0
            }
            if (instance_exists(other.baddieID) && other.baddieID.thrown == 0 && other.baddieID.stuntouchbuffer == 0 && other.baddieID.state != (100 << 0) && other.baddieID.vsp > 0 && state != (55 << 0) && state != (65 << 0) && state != (51 << 0) && state != (38 << 0) && state != (79 << 0) && state != (82 << 0) && state != (78 << 0) && state != (29 << 0) && state != (81 << 0) && other.baddieID.state != (112 << 0) && other.baddieID.bumpable && (!other.baddieID.invincible))
            {
                scr_soundeffect(sfx_bumpwall)
                if (state != (34 << 0) && state != (77 << 0) && state != (76 << 0))
                    movespeed = 0
                other.baddieID.stuntouchbuffer = 50
                if (other.baddieID.object_index == obj_pizzaball)
                    global.golfhit += 1
                if (other.baddieID.stunned < 100)
                    other.baddieID.stunned = 100
                if (x != other.baddieID.x)
                    other.baddieID.image_xscale = (-(sign((other.baddieID.x - x))))
                other.baddieID.vsp = -5
                other.baddieID.hsp = ((-other.baddieID.image_xscale) * 2)
                other.baddieID.state = (109 << 0)
                other.baddieID.image_index = 0
            }
            if (instance_exists(other.baddieID) && state == (29 << 0) && (!other.baddieID.invincible))
            {
                if (other.baddieID.thrown == 0 && (character == "P" || character == "N"))
                {
                    movespeed = 0
                    image_index = 0
                    sprite_index = spr_haulingstart
                    state = (54 << 0)
                    other.baddieID.state = (119 << 0)
                    other.baddieID.grabbedby = 1
                }
                else
                {
                    if (other.baddieID.thrown == 1 && (!key_up))
                    {
                        sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch)
                        other.baddieID.hsp = (xscale * 25)
                        other.baddieID.vsp = 0
                    }
                    else if (!key_up)
                    {
                        sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch)
                        other.baddieID.hsp = (xscale * 6)
                        scr_soundeffect(sfx_killingblow)
                        image_index = 0
                        state = (65 << 0)
                        movespeed = 0
                        other.baddieID.vsp = -6
                        scr_throwenemy()
                    }
                    else
                    {
                        sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch)
                        other.baddieID.vsp = -14
                        other.baddieID.hsp = 0
                    }
                    scr_soundeffect(sfx_killingblow)
                    image_index = 0
                    state = (65 << 0)
                    movespeed = 0
                    scr_throwenemy()
                }
            }
        }
    }
}
if (instance_exists(baddieID) && place_meeting(x, y, obj_player2) && obj_player2.cutscene == 0 && obj_player2.state != (10 << 0))
{
    if (baddieID.state != (119 << 0))
    {
        with (obj_player2)
        {
            if (instance_exists(other.baddieID) && instakillmove == 1 && other.baddieID.state != (119 << 0))
            {
                if (state == (92 << 0) && sprite_index != spr_mach3hit && character == "P")
                {
                    if (fightball == 0)
                        sprite_index = spr_mach3hit
                    image_index = 0
                    if (other.baddieID.object_index == obj_treasureguy)
                    {
                        sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch)
                        image_index = 0
                        state = (65 << 0)
                        movespeed = 3
                        vsp = -3
                    }
                }
                if (state == (78 << 0) && grounded)
                {
                    machpunchAnim = 1
                    image_index = 0
                    if (other.baddieID.object_index == obj_treasureguy)
                    {
                        sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch)
                        image_index = 0
                        state = (65 << 0)
                        movespeed = 3
                        vsp = -3
                    }
                }
                if (state != (81 << 0))
                    other.baddieID.grabbedby = 1
                else
                    other.baddieID.grabbedby = 2
                if instance_exists(other.baddieID)
                {
                    with (other.baddieID)
                    {
                        hp -= 1
                        instance_create(x, y, obj_slapstar)
                        instance_create(x, y, obj_slapstar)
                        instance_create(x, y, obj_slapstar)
                        instance_create(x, y, obj_baddiegibs)
                        instance_create(x, y, obj_baddiegibs)
                        instance_create(x, y, obj_baddiegibs)
                        with (obj_camera)
                        {
                            shake_mag = 3
                            shake_mag_acc = (3 / room_speed)
                        }
                        alarm[3] = 3
                        global.hit += 1
                        if (other.object_index == obj_pizzaball)
                            global.golfhit += 1
                        global.combotime = 60
                        alarm[1] = 5
                        stunned = 1000
                        thrown = 1
                        state = (109 << 0)
                    }
                }
            }
            global.hit += 1
            global.combotime = 60
            if ((!grounded) && state != (82 << 0) && key_jump2)
            {
                if (state == (78 << 0) || (state == (92 << 0) && fightball == 0))
                    sprite_index = spr_mach2jump
                suplexmove = 0
                vsp = -11
            }
        }
        if (instance_exists(other.baddieID) && y < other.baddieID.y && attacking == 0 && sprite_index != spr_player_mach2jump && (state == (66 << 0) || state == (77 << 0) || state == (54 << 0)) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep)
        {
            scr_soundeffect(sfx_stompenemy)
            if (x != other.baddieID.x)
                other.baddieID.image_xscale = (-(sign((other.baddieID.x - x))))
            image_index = 0
            other.baddieID.state = (109 << 0)
            if (other.baddieID.stunned < 100)
                other.baddieID.stunned = 100
            if key_jump2
            {
                instance_create(x, (y + 50), obj_stompeffect)
                stompAnim = 1
                other.baddieID.image_index = 0
                vsp = -14
                if (state != (54 << 0))
                    sprite_index = spr_stompprep
            }
            else
            {
                instance_create(x, (y + 50), obj_stompeffect)
                stompAnim = 1
                other.baddieID.image_index = 0
                vsp = -9
                if (state != (54 << 0))
                    sprite_index = spr_stompprep
            }
        }
        if (place_meeting(x, (y + 1), other.id) && state == (38 << 0) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_playerN_pogobounce)
        {
            switch pogochargeactive
            {
                case 0:
                    pogospeedprev = 0
                    other.baddieID.vsp = -3
                    scr_soundeffect(sfx_stompenemy)
                    other.baddieID.state = (109 << 0)
                    if (other.baddieID.stunned < 100)
                        other.baddieID.stunned = 100
                    sprite_index = spr_playerN_pogobounce
                    break
                case 1:
                    pogospeedprev = 0
                    instance_destroy(other.baddieID)
                    instance_destroy(other.id)
                    sprite_index = spr_playerN_pogobouncemach
                    break
            }

            instance_create(x, (y + 50), obj_stompeffect)
            image_index = 0
            movespeed = 0
            vsp = 0
        }
        if (instance_exists(other.baddieID) && other.baddieID.thrown == 0 && other.baddieID.state != (100 << 0) && other.baddieID.vsp > 0 && state != (55 << 0) && state != (65 << 0) && state != (51 << 0) && state != (38 << 0) && state != (79 << 0) && state != (82 << 0) && state != (78 << 0) && state != (81 << 0) && state != (29 << 0))
        {
            scr_soundeffect(sfx_bumpwall)
            if (state != (34 << 0) && state != (77 << 0))
                movespeed = 0
            other.baddieID.stuntouchbuffer = 50
            if (other.baddieID.object_index == obj_pizzaball)
                global.golfhit += 1
            if (other.baddieID.stunned < 100)
                other.baddieID.stunned = 100
            if (x != other.baddieID.x)
                other.baddieID.image_xscale = (-(sign((other.baddieID.x - x))))
            other.baddieID.vsp = -5
            other.baddieID.hsp = ((-other.baddieID.image_xscale) * 2)
            other.baddieID.state = (109 << 0)
            other.baddieID.image_index = 0
        }
        if (instance_exists(other.baddieID) && (state == (51 << 0) || state == (82 << 0)))
        {
            scr_soundeffect(sfx_hitenemy)
            global.combotime = 60
            instance_create(other.baddieID.x, other.baddieID.y, obj_baddiegibs)
            other.baddieID.flash = 1
            other.baddieID.state = (109 << 0)
            other.baddieID.hp -= 1
            if (other.baddieID.stunned < 100)
                other.baddieID.stunned = 100
            instance_create(x, y, obj_bumpeffect)
            instance_create(other.baddieID.x, other.baddieID.y, obj_bangeffect)
            if (other.baddieID.hp <= 0)
            {
                other.baddieID.stunned = 200
                other.baddieID.state = (109 << 0)
            }
            vsp = -7
            state = (0 << 0)
            other.baddieID.vsp = -4
            other.baddieID.hsp = (xscale * 5)
        }
        if (instance_exists(other.baddieID) && state == (29 << 0))
        {
            if (shotgunAnim == 0)
            {
                movespeed = 0
                image_index = 0
                sprite_index = spr_haulingstart
                state = (54 << 0)
                other.baddieID.state = (119 << 0)
                other.baddieID.grabbedby = 2
            }
            else
            {
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
                other.baddieID.grabbedby = 2
                instance_destroy(other.baddieID)
                instance_destroy(other.id)
                global.hit += 1
                global.combotime = 60
            }
        }
    }
}
