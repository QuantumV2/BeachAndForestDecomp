if (other.cutscene == 0)
{
    if (hurted == 0 && other.hurted == 0 && fightballadvantage == 1 && (state == (29 << 0) || state == (55 << 0)) && (other.state == (29 << 0) || other.state == (55 << 0)))
    {
        if (object_index == obj_player1)
        {
            obj_player1.state = (92 << 0)
            obj_player2.state = (119 << 0)
            obj_player2.xscale = xscale
            if (obj_player1.spotlight == 0)
            {
                obj_camera.shoving = 1
                obj_camera.image_index = 0
            }
            obj_player1.spotlight = 1
            scr_changetoppings()
            obj_player1.depth = -7
            obj_player2.depth = -6
        }
        if (object_index == obj_player2)
        {
            obj_player2.state = (92 << 0)
            obj_player1.state = (119 << 0)
            obj_player1.xscale = xscale
            if (obj_player1.spotlight == 1)
            {
                obj_camera.shoving = 1
                obj_camera.image_index = 0
            }
            obj_player1.spotlight = 0
            scr_changetoppings()
            obj_player1.depth = -6
            obj_player2.depth = -7
        }
        obj_player1.image_index = 0
        obj_player2.image_index = 0
        obj_player1.sprite_index = obj_player1.spr_fightball
        obj_player2.sprite_index = obj_player2.spr_fightball
        obj_player1.fightball = 1
        obj_player2.fightball = 1
    }
    with (obj_player2)
    {
        if (state == (29 << 0) && other.hurted == 0 && other.state != (81 << 0) && other.state != (25 << 0) && other.state != (31 << 0) && other.state != (5 << 0) && other.state != (9 << 0) && other.state != (34 << 0) && other.cutscene == 0 && other.hurted == 0 && hurted == 0 && (!((other.state == (29 << 0) || other.state == (55 << 0)))))
        {
            if (obj_player1.spotlight == 1)
            {
                obj_camera.shoving = 1
                obj_camera.image_index = 0
            }
            obj_player1.spotlight = 0
            scr_changetoppings()
            movespeed = 0
            image_index = 0
            sprite_index = spr_haulingstart
            baddiegrabbedID = other.id
            state = (54 << 0)
            other.state = (119 << 0)
            obj_player1.depth = -6
            obj_player2.depth = -7
        }
        if (state == (82 << 0) && other.hurted == 0 && other.state != (39 << 0) && other.state != (81 << 0) && hurted == 0)
        {
            if (obj_player1.spotlight == 1)
            {
                obj_camera.shoving = 1
                obj_camera.image_index = 0
            }
            obj_player1.spotlight = 0
            scr_changetoppings()
            obj_player1.depth = -6
            obj_player2.depth = -7
            obj_player1.state = (39 << 0)
            obj_player1.sprite_index = obj_player1.spr_squished
            obj_player1.image_index = 0
        }
        if (other.state == (55 << 0) && hurted == 0 && other.hurted == 0 && (!((state == (29 << 0) || state == (55 << 0)))))
        {
            xscale = (-other.xscale)
            with (other.id)
            {
                sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch)
                image_index = 0
                state = (65 << 0)
                movespeed = 3
                vsp = -3
            }
            if (obj_player1.spotlight == 0)
            {
                obj_camera.shoving = 1
                obj_camera.image_index = 0
            }
            obj_player1.spotlight = 1
            scr_changetoppings()
            obj_player1.depth = -7
            obj_player2.depth = -6
            thrown = 1
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
            state = (81 << 0)
            x = obj_player1.x
            y = obj_player1.y
            alarm[8] = 60
            alarm[7] = 120
            movespeed = 15
            vsp = -6
            sprite_index = spr_hurt
        }
    }
}
