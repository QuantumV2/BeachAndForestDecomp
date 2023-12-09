function scr_hurtplayer() {
    with (argument[0])
    {
        if global.failcutscene
        {
        }
        else if (state == (118 << 0))
        {
        }
        else if (state == (59 << 0))
        {
        }
        else if ((state == (31 << 0) || state == (32 << 0) || state == (25 << 0)) && cutscene == 0)
        {
        }
        else if (state == (13 << 0))
        {
        }
        else if (state == (34 << 0) && hurted == 0)
        {
        }
        else if (state == (21 << 0))
        {
        }
        else if (state == (22 << 0))
        {
        }
        else if (state == (87 << 0))
        {
        }
        else if (state == (5 << 0))
        {
        }
        else if (state == (19 << 0) || state == (20 << 0))
        {
        }
        else if (pizzashield == 1)
        {
            pizzashield = 0
            with (instance_create(x, y, obj_sausageman_dead))
                sprite_index = spr_pizzashield_collectible
            hsp = ((-xscale) * 4)
            vsp = -5
            state = (80 << 0)
            sprite_index = spr_bump
            alarm[8] = 60
            alarm[7] = 120
            hurted = 1
            scr_soundeffect(sfx_pephurt)
        }
        else if (state != (81 << 0) && state != (119 << 0) && hurted == 0 && cutscene == 0)
        {
            if (character == "V")
                global.playerhealth -= 25
            if (state == (11 << 0))
            {
                with (instance_create(x, y, obj_sausageman_dead))
                    sprite_index = spr_mortdead
                repeat (6)
                {
                    with (instance_create(x, y, obj_debris))
                        sprite_index = spr_feather
                }
                grav = 0.5
            }
            if (global.pizzadelivery == 0)
            {
                with (instance_create(x, y, obj_smallnumber))
                {
                    negative = 1
                    number = "-50"
                }
            }
            if (global.pizzadelivery == 1)
            {
                if (global.hp > 1)
                {
                    global.hp -= 1
                    with (obj_camera)
                        healthshaketime = 60
                }
                else
                {
                    with (obj_music)
                        arena = 0
                    vsp = -20
                    global.hp = 0
                    global.pizzadelivery = 0
                    cutscene = 1
                    with (instance_create(x, y, obj_debris))
                        sprite_index = spr_healthpickupeaten
                    with (instance_create(0, 0, obj_cutscene_handler))
                    {
                        var player = other.id
                                            scene_info = [[cutscene_taxi_start, player], [cutscene_waitfor_sprite, player], [cutscene_set_sprite, player, spr_player_outofpizza2, 0.5, player.xscale], [cutscene_player_check_ground, player], [cutscene_set_sprite, player, spr_player_outofpizza3, 0.5, player.xscale], [cutscene_waitfor_sprite, player], [cutscene_set_sprite, player, spr_player_outofpizza4, 0.5, player.xscale], [cutscene_taxi_end, player, forest_4]]
                    }
                }
            }
            if (state == (119 << 0))
            {
                if (object_index == obj_player1)
                    y = obj_player2.y
                else
                    y = obj_player1.y
            }
            scr_soundeffect(sfx_pephurt)
            alarm[8] = 100
            alarm[7] = 50
            hurted = 1
            if (xscale == other.image_xscale)
                sprite_index = spr_hurtjump
            else
                sprite_index = spr_hurt
            movespeed = 12
            vsp = -5
            timeuntilhpback = 300
            if (instance_exists(obj_player2) && global.coop == 1)
            {
                if (object_index == obj_player2)
                {
                    if (obj_player1.spotlight == 0)
                    {
                        obj_camera.shoving = 1
                        obj_camera.image_index = 0
                        obj_player1.spotlight = 1
                        scr_changetoppings()
                        obj_player1.depth = -7
                        obj_player2.depth = -6
                    }
                }
                if (object_index == obj_player1)
                {
                    if (obj_player1.spotlight == 1)
                    {
                        obj_camera.shoving = 1
                        obj_camera.image_index = 0
                        obj_player1.spotlight = 0
                        scr_changetoppings()
                        obj_player1.depth = -6
                        obj_player2.depth = -7
                    }
                }
            }
            instance_create(x, y, obj_spikehurteffect)
            state = (81 << 0)
            image_index = 0
            flash = 1
            global.hurtcounter += 1
            if (global.pizzadelivery == 0)
            {
                if (global.collect > 50)
                    global.collect -= 50
                else
                    global.collect = 0
            }
            if (global.pizzadelivery == 0)
            {
                if (global.collect != 0)
                {
                    if (character == "P" || character == "V")
                    {
                        repeat (10)
                        {
                            with (instance_create(x, y, obj_pizzaloss))
                                sprite_index = choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect)
                        }
                    }
                    else
                    {
                        repeat (10)
                            instance_create(x, y, obj_pizzaloss)
                    }
                }
            }
        }
    }
}