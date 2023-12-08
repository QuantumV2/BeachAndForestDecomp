if (room == rm_editor)
    return;
if (ds_list_find_index(global.baddieroom, id) == -1 && important == 0)
{
    var i = random_range(0, 100)
    if (i >= 95)
        scr_soundeffect(sfx_scream1, sfx_scream2, sfx_scream3, sfx_scream4, 44, 45, 46, 47, 48, 49)
    scr_soundeffect(sfx_killenemy)
    scr_sleep(50)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_bangeffect)
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
    with (instance_create(x, y, obj_sausageman_dead))
        sprite_index = other.spr_dead
    global.style += 5
    ds_list_add(global.baddieroom, id)
    obj_tv.image_index = random_range(0, 4)
    global.combo += 1
    if (global.timeattack == 0)
    {
        if (global.combo == 1)
        {
            var num = 10
            switch global.stylethreshold
            {
                case 1:
                    num = (num * 2)
                    break
                case 2:
                    num = (num * 3)
                    break
                case 3:
                    num = (num * 4)
                    break
            }

            if (grabbedby == 1)
                global.collect += num
            else if (grabbedby == 2)
                global.collectN += num
            else
                global.collect += num
            with (instance_create(x, y, obj_smallnumber))
            {
                number = string(num)
                switch global.stylethreshold
                {
                    case 1:
                        color = 0x000001
                        break
                    case 2:
                        color = 0x000002
                        break
                    case 3:
                        color = 0x000003
                        break
                }

            }
        }
        if (global.combo == 2)
        {
            num = 20
            switch global.stylethreshold
            {
                case 1:
                    num = (num * 2)
                    break
                case 2:
                    num = (num * 3)
                    break
                case 3:
                    num = (num * 4)
                    break
            }

            if (grabbedby == 1)
                global.collect += num
            else if (grabbedby == 2)
                global.collectN += num
            else
                global.collect += num
            with (instance_create(x, y, obj_smallnumber))
            {
                number = string(num)
                switch global.stylethreshold
                {
                    case 1:
                        color = 0x000001
                        break
                    case 2:
                        color = 0x000002
                        break
                    case 3:
                        color = 0x000003
                        break
                }

            }
        }
        if (global.combo == 3)
        {
            num = 30
            switch global.stylethreshold
            {
                case 1:
                    num = (num * 2)
                    break
                case 2:
                    num = (num * 3)
                    break
                case 3:
                    num = (num * 4)
                    break
            }

            if (grabbedby == 1)
                global.collect += num
            else if (grabbedby == 2)
                global.collectN += num
            else
                global.collect += num
            with (instance_create(x, y, obj_smallnumber))
            {
                number = string(num)
                switch global.stylethreshold
                {
                    case 1:
                        color = 0x000001
                        break
                    case 2:
                        color = 0x000002
                        break
                    case 3:
                        color = 0x000003
                        break
                }

            }
        }
        if (global.combo >= 4)
        {
            num = 40
            switch global.stylethreshold
            {
                case 1:
                    num = (num * 2)
                    break
                case 2:
                    num = (num * 3)
                    break
                case 3:
                    num = (num * 4)
                    break
            }

            if (grabbedby == 1)
                global.collect += num
            else if (grabbedby == 2)
                global.collectN += num
            else
                global.collect += num
            with (instance_create(x, y, obj_smallnumber))
            {
                number = string(num)
                switch global.stylethreshold
                {
                    case 1:
                        color = 0x000001
                        break
                    case 2:
                        color = 0x000002
                        break
                    case 3:
                        color = 0x000003
                        break
                }

            }
        }
    }
    global.combotime = 60
}
else if (ds_list_find_index(global.baddieroom, id) == -1 && important == 1)
{
    scr_sleep(50)
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
    with (instance_create(x, y, obj_sausageman_dead))
        sprite_index = other.spr_dead
}
