if (room == rm_editor)
    return;
if (ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == 0)
{
    scr_soundeffect(sfx_escaperumble)
    obj_camera.alarm[1] = 60
    instance_create(x, y, obj_bangeffect)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    if (global.coop == 1)
    {
        obj_player1.x = x
        obj_player2.x = x
        obj_player1.y = y
        obj_player2.y = y
    }
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
    instance_destroy()
    with (instance_create(x, y, obj_sausageman_dead))
        sprite_index = spr_hungrypillar_dead
    scr_soundeffect(sfx_killenemy)
    instance_create(x, (y + 600), obj_itspizzatime)
    global.panic = 1
    switch room
    {
        case entrance_10:
            global.minutes = 2
            global.seconds = 30
            break
        case medieval_10:
            global.minutes = 2
            global.seconds = 15
            break
        case ruin_11:
            global.minutes = 1
            global.seconds = 59
            break
        case dungeon_10:
            global.minutes = 2
            global.seconds = 30
            break
        case chateau_6:
            global.minutes = 2
            global.seconds = 15
            break
        case strongcold_1:
            global.minutes = 2
            global.seconds = 30
            break
        case dragonlair_1:
            global.minutes = 0
            global.seconds = 59
            break
        case floor1_room11:
            global.minutes = 1
            global.seconds = 59
            break
        case graveyard_6:
            global.minutes = 3
            global.seconds = 59
            break
        case farm_11:
            global.minutes = 2
            global.seconds = 59
            break
        case ufo_12:
            global.minutes = 2
            global.seconds = 59
            break
        case beach_13:
            global.minutes = 3
            global.seconds = 30
            break
        case forest_5:
            global.minutes = 3
            global.seconds = 30
            break
        case custom_lvl_room:
            global.minutes = 2
            global.seconds = 15
            break
    }

    ds_list_add(global.saveroom, id)
}
