if (room == rm_editor)
    return;
if (obj_player.state != (81 << 0) && global.shroomfollow == 0)
{
    global.combotime = 60
    global.style += 50
    ds_list_add(global.saveroom, id)
    if (global.toppintotal < 5)
        obj_tv.message = (("YOU NEED " + string((5 - global.toppintotal))) + " MORE TOPPINS!")
    if (global.toppintotal == 5)
        obj_tv.message = "YOU HAVE ALL TOPPINS!"
    obj_tv.showtext = 1
    obj_tv.alarm[0] = 150
    global.toppintotal += 1
    global.shroomfollow = 1
    panic = 0
}