if (room == rm_editor)
    return;
hsp = (image_xscale * movespeed)
if (grounded && vsp > 0)
    vsp = -5
if place_meeting((x + hsp), y, obj_solid)
{
    image_xscale *= -1
    movespeed = 2
}
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.05 * room_speed)
if (hitboxcreate == 0)
{
    with (instance_create(x, y, obj_forkhitbox))
    {
        ID = other.id
        image_xscale = other.image_xscale
        sprite_index = other.sprite_index
        mask_index = other.mask_index
        other.hitboxcreate = 1
    }
}
if (movespeed < 6)
    movespeed += 0.1
scr_collide()
