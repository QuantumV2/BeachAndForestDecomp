if (vsp < 12)
    vsp += grav
x += hsp
y += floor(vsp)
if place_meeting(x, y, obj_solid)
    instance_destroy()
