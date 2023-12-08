var playerid = obj_player1
if (obj_player1.spotlight == 0)
    playerid = obj_player2
x = median((x - maxspeed), playerid.x, (x + maxspeed))
y = median((y - maxspeed), playerid.y, (y + maxspeed))
if (place_meeting(x, y, playerid) && (!instance_exists(obj_fadeout)) && (!instance_exists(obj_endlevelfade)))
{
    if instance_exists(obj_toppinwarrior)
    {
        if (variable_global_exists("toppinwarriorid1") && instance_exists(global.toppinwarriorid1))
            instance_destroy(global.toppinwarriorid1)
        else if (variable_global_exists("toppinwarriorid2") && instance_exists(global.toppinwarriorid2))
            instance_destroy(global.toppinwarriorid2)
        else if (variable_global_exists("toppinwarriorid3") && instance_exists(global.toppinwarriorid3))
            instance_destroy(global.toppinwarriorid3)
        else if (variable_global_exists("toppinwarriorid4") && instance_exists(global.toppinwarriorid4))
            instance_destroy(global.toppinwarriorid4)
        else if (variable_global_exists("toppinwarriorid5") && instance_exists(global.toppinwarriorid5))
            instance_destroy(global.toppinwarriorid5)
        instance_create(x, y, obj_flash)
        global.seconds = 59
        obj_camera.alarm[1] = 60
        obj_camera.ded = 0
        instance_destroy()
    }
    else if (!instance_exists(obj_toppinwarrior))
    {
        with (playerid)
        {
            targetDoor = "A"
            room = timesuproom
            state = (44 << 0)
            sprite_index = spr_Timesup
            image_index = 0
            audio_stop_all()
            scr_soundeffect(mu_timesup)
        }
    }
    instance_destroy()
}
maxspeed += 0.01
