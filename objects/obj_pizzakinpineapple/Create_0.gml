image_speed = 0.35
if (room == rm_editor)
{
    if (instance_number(obj_pizzakinshroom) > 1)
        instance_destroy()
    if place_meeting(x, (y + 32), obj_solid)
    {
        while (!(place_meeting(x, (y + 1), obj_solid)))
            y += 1
    }
    return;
}
followQueue = ds_queue_create()
hsp = 0
vsp = 0
grav = 0.23
movespeed = 3
panic = 0
playerid = obj_player1
