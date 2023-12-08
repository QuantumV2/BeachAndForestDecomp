function scr_enemy_grabbed() {
    if (object_index == obj_treasureguy)
    {
        var player = asset_get_index(("obj_player" + string(grabbedby)))
        with (player)
        {
            sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch)
            image_index = 0
            state = (65 << 0)
            movespeed = 3
            vsp = -3
        }
        instance_destroy()
    }
    if (grabbedby == 1)
    {
        image_xscale = (-obj_player1.xscale)
        stunned = 200
        obj_player1.baddiegrabbedID = id
        if (obj_player1.state == (35 << 0) || obj_player1.state == (54 << 0) || obj_player1.state == (49 << 0) || obj_player1.state == (50 << 0) || obj_player1.state == (16 << 0))
        {
            x = obj_player1.x
            if (obj_player1.sprite_index != obj_player1.spr_haulingstart)
                y = (obj_player1.y - 40)
            else if (floor(obj_player1.image_index) == 0)
                y = obj_player1.y
            else if (floor(obj_player1.image_index) == 1)
                y = (obj_player1.y - 10)
            else if (floor(obj_player1.image_index) == 2)
                y = (obj_player1.y - 20)
            else if (floor(obj_player1.image_index) == 3)
                y = (obj_player1.y - 30)
            image_xscale = (-obj_player1.xscale)
        }
        with (obj_player1)
        {
            suplexhavetomash = (other.hp - 1)
            scr_getinput()
            move = (key_left2 + key_right2)
            if (key_slap && sprite_index == spr_grab)
            {
                global.hit += 1
                if (other.object_index == obj_pizzaball)
                    global.golfhit += 1
                global.combotime = 60
                image_index = 0
                sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4)
                other.hp -= 1
                instance_create(other.x, other.y, obj_slapstar)
                instance_create(other.x, other.y, obj_baddiegibs)
                other.flash = 1
                with (obj_camera)
                {
                    shake_mag = 3
                    shake_mag_acc = (3 / room_speed)
                }
            }
            if (!((state == (54 << 0) || state == (6 << 0) || state == (35 << 0) || state == (49 << 0) || state == (50 << 0) || state == (16 << 0) || state == (55 << 0) || state == (51 << 0) || state == (56 << 0) || state == (57 << 0) || state == (58 << 0))))
            {
                other.x = x
                other.y = y
                other.state = (109 << 0)
                other.image_index = 0
            }
        }
        hsp = 0
        if (obj_player1.state == (55 << 0) || obj_player1.state == (118 << 0))
        {
            alarm[3] = 3
            global.hit += 1
            if (other.object_index == obj_pizzaball)
                global.golfhit += 1
            hp -= 1
            instance_create((x + (obj_player1.xscale * 30)), y, obj_bumpeffect)
            alarm[1] = 5
            thrown = 1
            x = obj_player1.x
            vsp = 0
            y = obj_player1.y
            state = (109 << 0)
            hsp = ((-image_xscale) * 25)
            grav = 0
            global.combotime = 60
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_baddiegibs)
            flash = 1
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = (3 / room_speed)
            }
        }
        if (obj_player1.state == (6 << 0) && obj_player1.image_index < 5)
        {
            x = (obj_player1.x + (obj_player1.xscale * 60))
            y = obj_player1.y
        }
        if (obj_player1.state == (56 << 0))
        {
            alarm[3] = 3
            global.hit += 1
            if (other.object_index == obj_pizzaball)
                global.golfhit += 1
            hp -= 1
            instance_create((x + ((-obj_player1.xscale) * 50)), y, obj_bumpeffect)
            alarm[1] = 5
            thrown = 1
            x = obj_player1.x
            y = obj_player1.y
            state = (109 << 0)
            image_xscale *= -1
            hsp = ((-image_xscale) * 20)
            vsp = -7
            global.combotime = 60
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_baddiegibs)
            flash = 1
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = (3 / room_speed)
            }
        }
        if (obj_player1.state == (58 << 0))
        {
            alarm[3] = 3
            global.hit += 1
            if (other.object_index == obj_pizzaball)
                global.golfhit += 1
            hp -= 1
            instance_create(x, (y + 20), obj_bumpeffect)
            alarm[1] = 5
            thrown = 1
            x = obj_player1.x
            y = obj_player1.y
            state = (109 << 0)
            if (obj_player1.sprite_index == spr_player_shoulder)
                vsp = 15
            if (obj_player1.sprite_index == spr_player_diagonaldownthrow)
            {
                hsp = ((-image_xscale) * 10)
                vsp = 15
            }
            if (obj_player1.sprite_index == spr_player_diagonalupthrow)
            {
                hsp = ((-image_xscale) * 10)
                vsp = -15
            }
            global.combotime = 60
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_baddiegibs)
            flash = 1
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = (3 / room_speed)
            }
        }
        if place_meeting(x, y, obj_swordhitbox)
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
            thrown = 1
            state = (109 << 0)
            with (obj_player1)
            {
                move = (key_right + key_left)
                if (sprite_index == spr_uppercutfinishingblow)
                {
                    other.hsp = 0
                    other.vsp = -25
                }
                else
                {
                    other.hsp = ((-other.image_xscale) * 25)
                    other.vsp = -6
                }
            }
        }
        if (obj_player1.state == (49 << 0))
        {
            global.hit += 1
            if (other.object_index == obj_pizzaball)
                global.golfhit += 1
            alarm[1] = 5
            thrown = 1
            x = obj_player1.x
            y = obj_player1.y
            state = (109 << 0)
            hsp = ((-image_xscale) * 8)
            vsp = -6
        }
        if (obj_player1.state == (57 << 0))
        {
            alarm[3] = 3
            global.hit += 1
            if (other.object_index == obj_pizzaball)
                global.golfhit += 1
            hp -= 1
            instance_create((x + ((-obj_player1.xscale) * 15)), (y - 50), obj_bumpeffect)
            alarm[1] = 5
            thrown = 1
            x = obj_player1.x
            y = obj_player1.y
            hsp = ((-image_xscale) * 2)
            state = (109 << 0)
            vsp = -20
            global.combotime = 60
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_baddiegibs)
            flash = 1
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = (3 / room_speed)
            }
        }
        if (obj_player1.state == (16 << 0))
        {
            x = (obj_player1.x + (obj_player1.xscale * 15))
            y = obj_player1.y
        }
        if (obj_player1.state == (51 << 0) && obj_player1.sprite_index == obj_player1.spr_piledriver)
        {
            if (obj_player1.character == "P")
            {
                if (floor(obj_player1.image_index) == 0)
                {
                    depth = 0
                    x = (obj_player1.x + (obj_player1.xscale * 10))
                    y = obj_player1.y
                }
                if (floor(obj_player1.image_index) == 1)
                {
                    depth = 0
                    x = (obj_player1.x + (obj_player1.xscale * 5))
                    y = obj_player1.y
                }
                if (floor(obj_player1.image_index) == 2)
                {
                    depth = 0
                    x = obj_player1.x
                    y = obj_player1.y
                }
                if (floor(obj_player1.image_index) == 3)
                {
                    depth = 0
                    x = (obj_player1.x + (obj_player1.xscale * -5))
                    y = obj_player1.y
                }
                if (floor(obj_player1.image_index) == 4)
                {
                    depth = 0
                    x = (obj_player1.x + (obj_player1.xscale * -10))
                    y = obj_player1.y
                }
                if (floor(obj_player1.image_index) == 5)
                {
                    depth = -8
                    x = (obj_player1.x + (obj_player1.xscale * -5))
                    y = obj_player1.y
                }
                if (floor(obj_player1.image_index) == 6)
                {
                    depth = -8
                    x = obj_player1.x
                    y = obj_player1.y
                }
                if (floor(obj_player1.image_index) == 7)
                {
                    depth = -8
                    x = (obj_player1.x + (obj_player1.xscale * 5))
                    y = obj_player1.y
                }
            }
            else
            {
                depth = -7
                x = obj_player1.x
                y = (obj_player1.y - 40)
            }
        }
        if (obj_player1.sprite_index == obj_player1.spr_piledriverland && floor(obj_player1.image_index) == (obj_player1.image_number - 1))
        {
            with (obj_player1)
            {
                state = (66 << 0)
                vsp = -8
                sprite_index = spr_machfreefall
            }
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_baddiegibs)
            flash = 1
            global.combotime = 60
            global.hit += 1
            hp -= 5
            alarm[1] = 5
            thrown = 1
            x = obj_player1.x
            y = obj_player1.y
            state = (109 << 0)
            hsp = ((-image_xscale) * 10)
            vsp = -10
        }
        if (obj_player1.state == (54 << 0) && obj_player1.sprite_index == obj_player1.spr_swingding)
        {
            if (floor(obj_player1.image_index) == 0)
            {
                depth = -8
                x = (obj_player1.x + (obj_player1.xscale * 25))
                y = obj_player1.y
            }
            if (floor(obj_player1.image_index) == 1)
            {
                depth = -8
                x = obj_player1.x
                y = obj_player1.y
            }
            if (floor(obj_player1.image_index) == 2)
            {
                depth = -8
                x = (obj_player1.x + (obj_player1.xscale * -25))
                y = obj_player1.y
            }
            if (floor(obj_player1.image_index) == 3)
            {
                depth = 0
                x = (obj_player1.x + (obj_player1.xscale * -50))
                y = obj_player1.y
            }
            if (floor(obj_player1.image_index) == 4)
            {
                depth = 0
                x = (obj_player1.x + (obj_player1.xscale * -25))
                y = obj_player1.y
            }
            if (floor(obj_player1.image_index) == 5)
            {
                depth = 0
                x = obj_player1.x
                y = obj_player1.y
            }
            if (floor(obj_player1.image_index) == 6)
            {
                depth = 0
                x = (obj_player1.x + (obj_player1.xscale * 25))
                y = obj_player1.y
            }
            if (floor(obj_player1.image_index) == 7)
            {
                depth = 0
                x = (obj_player1.x + (obj_player1.xscale * 50))
                y = obj_player1.y
            }
        }
    }
    if (grabbedby == 2)
    {
        image_xscale = (-obj_player2.xscale)
        stunned = 200
        obj_player2.baddiegrabbedID = id
        if (obj_player2.state == (35 << 0) || obj_player2.state == (54 << 0) || obj_player2.state == (49 << 0) || obj_player2.state == (50 << 0) || obj_player2.state == (16 << 0))
        {
            x = obj_player2.x
            if (obj_player2.sprite_index != obj_player2.spr_haulingstart)
                y = (obj_player2.y - 40)
            else if (floor(obj_player2.image_index) == 0)
                y = obj_player2.y
            else if (floor(obj_player2.image_index) == 1)
                y = (obj_player2.y - 10)
            else if (floor(obj_player2.image_index) == 2)
                y = (obj_player2.y - 20)
            else if (floor(obj_player2.image_index) == 3)
                y = (obj_player2.y - 30)
            image_xscale = (-obj_player2.xscale)
        }
        with (obj_player2)
        {
            suplexhavetomash = (other.hp - 1)
            scr_getinput()
            move = (key_left2 + key_right2)
            if (key_slap && sprite_index == spr_grab)
            {
                global.hit += 1
                if (other.object_index == obj_pizzaball)
                    global.golfhit += 1
                global.combotime = 60
                image_index = 0
                sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4)
                other.hp -= 1
                instance_create(other.x, other.y, obj_slapstar)
                instance_create(other.x, other.y, obj_baddiegibs)
                other.flash = 1
                with (obj_camera)
                {
                    shake_mag = 3
                    shake_mag_acc = (3 / room_speed)
                }
            }
            if (!((state == (54 << 0) || state == (6 << 0) || state == (35 << 0) || state == (49 << 0) || state == (50 << 0) || state == (16 << 0) || state == (55 << 0) || state == (51 << 0) || state == (56 << 0) || state == (57 << 0) || state == (58 << 0))))
            {
                other.x = x
                other.y = y
                other.state = (109 << 0)
                other.image_index = 0
            }
        }
        hsp = 0
        if (obj_player2.state == (55 << 0) || obj_player2.state == (118 << 0))
        {
            alarm[3] = 3
            global.hit += 1
            if (other.object_index == obj_pizzaball)
                global.golfhit += 1
            hp -= 1
            instance_create((x + (obj_player2.xscale * 30)), y, obj_bumpeffect)
            alarm[1] = 5
            thrown = 1
            x = obj_player2.x
            vsp = 0
            y = obj_player2.y
            state = (109 << 0)
            hsp = ((-image_xscale) * 25)
            grav = 0
            global.combotime = 60
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_baddiegibs)
            flash = 1
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = (3 / room_speed)
            }
        }
        if (obj_player2.state == (6 << 0) && obj_player2.image_index < 5)
        {
            x = (obj_player2.x + (obj_player2.xscale * 60))
            y = obj_player2.y
        }
        if (obj_player2.state == (56 << 0))
        {
            alarm[3] = 3
            global.hit += 1
            if (other.object_index == obj_pizzaball)
                global.golfhit += 1
            hp -= 1
            instance_create((x + ((-obj_player2.xscale) * 50)), y, obj_bumpeffect)
            alarm[1] = 5
            thrown = 1
            x = obj_player2.x
            y = obj_player2.y
            state = (109 << 0)
            image_xscale *= -1
            hsp = ((-image_xscale) * 20)
            vsp = -7
            global.combotime = 60
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_baddiegibs)
            flash = 1
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = (3 / room_speed)
            }
        }
        if (obj_player2.state == (58 << 0))
        {
            alarm[3] = 3
            global.hit += 1
            if (other.object_index == obj_pizzaball)
                global.golfhit += 1
            hp -= 1
            instance_create(x, (y + 20), obj_bumpeffect)
            alarm[1] = 5
            thrown = 1
            x = obj_player2.x
            y = obj_player2.y
            state = (109 << 0)
            if (obj_player2.sprite_index == spr_player_shoulder)
                vsp = 15
            if (obj_player2.sprite_index == spr_player_diagonaldownthrow)
            {
                hsp = ((-image_xscale) * 10)
                vsp = 15
            }
            if (obj_player2.sprite_index == spr_player_diagonalupthrow)
            {
                hsp = ((-image_xscale) * 10)
                vsp = -15
            }
            global.combotime = 60
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_baddiegibs)
            flash = 1
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = (3 / room_speed)
            }
        }
        if place_meeting(x, y, obj_swordhitbox)
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
            thrown = 1
            state = (109 << 0)
            with (obj_player2)
            {
                move = (key_right + key_left)
                if (sprite_index == spr_uppercutfinishingblow)
                {
                    other.hsp = 0
                    other.vsp = -25
                }
                else
                {
                    other.hsp = ((-other.image_xscale) * 25)
                    other.vsp = -6
                }
            }
        }
        if (obj_player2.state == (49 << 0))
        {
            global.hit += 1
            if (other.object_index == obj_pizzaball)
                global.golfhit += 1
            alarm[1] = 5
            thrown = 1
            x = obj_player2.x
            y = obj_player2.y
            state = (109 << 0)
            hsp = ((-image_xscale) * 8)
            vsp = -6
        }
        if (obj_player2.state == (57 << 0))
        {
            alarm[3] = 3
            global.hit += 1
            if (other.object_index == obj_pizzaball)
                global.golfhit += 1
            hp -= 1
            instance_create((x + ((-obj_player2.xscale) * 15)), (y - 50), obj_bumpeffect)
            alarm[1] = 5
            thrown = 1
            x = obj_player2.x
            y = obj_player2.y
            hsp = ((-image_xscale) * 2)
            state = (109 << 0)
            vsp = -20
            global.combotime = 60
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_baddiegibs)
            flash = 1
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = (3 / room_speed)
            }
        }
        if (obj_player2.state == (16 << 0))
        {
            x = (obj_player2.x + (obj_player2.xscale * 15))
            y = obj_player2.y
        }
        if (obj_player2.state == (51 << 0) && obj_player2.sprite_index == obj_player2.spr_piledriver)
        {
            if (obj_player2.character == "P")
            {
                if (floor(obj_player2.image_index) == 0)
                {
                    depth = 0
                    x = (obj_player2.x + (obj_player2.xscale * 10))
                    y = obj_player2.y
                }
                if (floor(obj_player2.image_index) == 1)
                {
                    depth = 0
                    x = (obj_player2.x + (obj_player2.xscale * 5))
                    y = obj_player2.y
                }
                if (floor(obj_player2.image_index) == 2)
                {
                    depth = 0
                    x = obj_player2.x
                    y = obj_player2.y
                }
                if (floor(obj_player2.image_index) == 3)
                {
                    depth = 0
                    x = (obj_player2.x + (obj_player2.xscale * -5))
                    y = obj_player2.y
                }
                if (floor(obj_player2.image_index) == 4)
                {
                    depth = 0
                    x = (obj_player2.x + (obj_player2.xscale * -10))
                    y = obj_player2.y
                }
                if (floor(obj_player2.image_index) == 5)
                {
                    depth = -8
                    x = (obj_player2.x + (obj_player2.xscale * -5))
                    y = obj_player2.y
                }
                if (floor(obj_player2.image_index) == 6)
                {
                    depth = -8
                    x = obj_player2.x
                    y = obj_player2.y
                }
                if (floor(obj_player2.image_index) == 7)
                {
                    depth = -8
                    x = (obj_player2.x + (obj_player2.xscale * 5))
                    y = obj_player2.y
                }
            }
            else
            {
                depth = -7
                x = obj_player2.x
                y = (obj_player2.y - 40)
            }
        }
        if (obj_player2.sprite_index == obj_player2.spr_piledriverland && floor(obj_player2.image_index) == (obj_player2.image_number - 1))
        {
            with (obj_player2)
            {
                state = (66 << 0)
                vsp = -8
                sprite_index = spr_machfreefall
            }
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_baddiegibs)
            flash = 1
            global.combotime = 60
            global.hit += 1
            hp -= 5
            alarm[1] = 5
            thrown = 1
            x = obj_player2.x
            y = obj_player2.y
            state = (109 << 0)
            hsp = ((-image_xscale) * 10)
            vsp = -10
        }
        if (obj_player2.state == (54 << 0) && obj_player2.sprite_index == obj_player2.spr_swingding)
        {
            if (floor(obj_player2.image_index) == 0)
            {
                depth = -8
                x = (obj_player2.x + (obj_player2.xscale * 25))
                y = obj_player2.y
            }
            if (floor(obj_player2.image_index) == 1)
            {
                depth = -8
                x = obj_player2.x
                y = obj_player2.y
            }
            if (floor(obj_player2.image_index) == 2)
            {
                depth = -8
                x = (obj_player2.x + (obj_player2.xscale * -25))
                y = obj_player2.y
            }
            if (floor(obj_player2.image_index) == 3)
            {
                depth = 0
                x = (obj_player2.x + (obj_player2.xscale * -50))
                y = obj_player2.y
            }
            if (floor(obj_player2.image_index) == 4)
            {
                depth = 0
                x = (obj_player2.x + (obj_player2.xscale * -25))
                y = obj_player2.y
            }
            if (floor(obj_player2.image_index) == 5)
            {
                depth = 0
                x = obj_player2.x
                y = obj_player2.y
            }
            if (floor(obj_player2.image_index) == 6)
            {
                depth = 0
                x = (obj_player2.x + (obj_player2.xscale * 25))
                y = obj_player2.y
            }
            if (floor(obj_player2.image_index) == 7)
            {
                depth = 0
                x = (obj_player2.x + (obj_player2.xscale * 50))
                y = obj_player2.y
            }
        }
    }
    sprite_index = grabbedspr
    image_speed = 0.35
}