function scr_pizzagoblin_throw() {
    if (!variable_global_exists("throw_frame"))
    {
        global.throw_frame = 0
        global.throw_frame[112] = 2
        global.throw_frame[114] = 5
        global.throw_frame[113] = 18
        global.throw_frame[108] = 6
        global.throw_frame[124] = 2
        global.throw_frame[125] = 2
        global.throw_frame[126] = 2
        global.throw_frame[110] = 2
        global.throw_frame[111] = 8
        global.throw_frame[116] = 6
        global.throw_frame[120] = 0
        global.throw_frame[119] = 15
        global.throw_frame[118] = 3
        global.throw_frame[117] = 2
        global.throw_frame[130] = 6
        global.throw_frame[100] = 3
        global.throw_frame[101] = 3
        global.throw_sprite = spr_plug
        global.throw_sprite[112] = spr_pizzagoblin_throwbomb
        global.throw_sprite[114] = spr_canongoblin_throwbomb
        global.throw_sprite[113] = spr_archergoblin_shoot
        global.throw_sprite[108] = spr_cheeserobot_attack
        global.throw_sprite[124] = spr_spitcheese_spit
        global.throw_sprite[125] = spr_trash_throw
        global.throw_sprite[126] = spr_invtrash_throw
        global.throw_sprite[110] = spr_robot_attack
        global.throw_sprite[111] = spr_kentukykenny_throw
        global.throw_sprite[116] = spr_pizzard_shoot
        global.throw_sprite[120] = spr_pepgoblin_kick
        global.throw_sprite[119] = spr_swedishmonkey_eat
        global.throw_sprite[118] = spr_ranch_shoot
        global.throw_sprite[117] = spr_pickle_attack
        global.throw_sprite[130] = spr_tank_shoot
        global.throw_sprite[100] = spr_slimemove
        global.throw_sprite[101] = spr_slimemove
        global.reset_timer = 0
        global.reset_timer[112] = 200
        global.reset_timer[114] = 200
        global.reset_timer[113] = 200
        global.reset_timer[108] = 200
        global.reset_timer[124] = 100
        global.reset_timer[125] = 100
        global.reset_timer[126] = 100
        global.reset_timer[110] = 200
        global.reset_timer[111] = 200
        global.reset_timer[116] = 100
        global.reset_timer[120] = 100
        global.reset_timer[119] = 200
        global.reset_timer[118] = 100
        global.reset_timer[117] = 120
        global.reset_timer[130] = 100
        global.reset_timer[100] = 120
        global.reset_timer[101] = 150
    }
    hsp = 0
    if place_meeting(x, (y + 1), obj_railh)
        hsp = -5
    else if place_meeting(x, (y + 1), obj_railh2)
        hsp = 5
    if (floor(image_index) == (image_number - 1))
    {
        state = (105 << 0)
        sprite_index = walkspr
    }
    if (bombreset == 0 && floor(image_index) == global.throw_frame[object_index])
    {
        bombreset = global.reset_timer[object_index]
        sprite_index = global.throw_sprite[object_index]
        if point_in_rectangle(x, y, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])))
            scr_soundeffect(sfx_enemyprojectile)
        switch object_index
        {
            case obj_pizzagoblin:
                with (instance_create(x, y, obj_pizzagoblinbomb))
                {
                    hsp = (other.image_xscale * 10)
                    vsp = -8
                }
                break
            case obj_canongoblin:
                with (instance_create(x, y, obj_canongoblinbomb))
                    image_xscale = other.image_xscale
                break
            case obj_noisegoblin:
                with (instance_create(x, y, obj_noisegoblin_arrow))
                {
                }
                break
            case obj_cheeserobot:
                with (instance_create(x, y, obj_cheeseblob))
                {
                    sprite_index = spr_cheeserobot_goop
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 8)
                    vsp = 0
                    grav = 0
                }
                break
            case obj_spitcheese:
                with (instance_create((x + (image_xscale * 6)), (y - 6), obj_spitcheesespike))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                    vsp = -6
                }
                break
            case obj_trash:
            case obj_invtrash:
                with (instance_create((x + (image_xscale * 6)), (y - 6), obj_cheeseball))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                    vsp = -4
                }
                break
            case obj_robot:
                with (instance_create(x, y, obj_robotknife))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                }
                break
            case obj_kentukykenny:
                with (instance_create(x, y, obj_kentukykenny_projectile))
                    image_xscale = other.image_xscale
                break
            case obj_pizzard:
                with (instance_create(x, y, obj_pizzard_bolt))
                    image_xscale = other.image_xscale
                break
            case obj_swedishmonkey:
                with (instance_create(x, y, obj_slipnslide))
                {
                    baddieID = other.id
                    image_xscale = other.image_xscale
                    hsp = ((-other.image_xscale) * 4)
                    vsp = -5
                    with (obj_slipnslide)
                    {
                        if (baddieID == other.baddieID)
                            banana += 1
                    }
                }
                break
            case obj_pepgoblin:
                with (instance_create(x, y, obj_pepgoblin_kickhitbox))
                {
                    baddieID = other.id
                    image_xscale = other.image_xscale
                }
                break
            case obj_pickle:
                attacking = 0
                with (instance_create(x, y, obj_forkhitbox))
                {
                    ID = other.id
                    image_xscale = other.image_xscale
                    sprite_index = other.sprite_index
                }
                break
            case obj_tank:
                with (instance_create((x + (image_xscale * 6)), (y - 6), obj_spitcheesespike))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                    vsp = -6
                }
                break
            case obj_thug_blue:
                with (instance_create(x, y, obj_robotknife))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                }
                break
            case obj_thug_green:
                with (instance_create(x, y, obj_junkenemy))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 7)
                    vsp = -8
                }
                break
            case obj_rancher:
                with (instance_create(x, y, obj_rancher_bullet))
                    image_xscale = other.image_xscale
                break
        }
    
    }
    if ((!grounded) && hsp < 0)
        hsp += 0.1
    else if ((!grounded) && hsp > 0)
        hsp -= 0.1
}