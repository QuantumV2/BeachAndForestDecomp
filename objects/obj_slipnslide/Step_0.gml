if (obj_player.state == (85 << 0) && grounded)
{
    if point_in_rectangle(x, y, __view_get((0 << 0), 0), __view_get((1 << 0), 0), (__view_get((0 << 0), 0) + __view_get((2 << 0), 0)), (__view_get((1 << 0), 0) + __view_get((3 << 0), 0)))
    {
        drop = 1
        vsp = -5
    }
}
if (drop == 0)
    scr_collide()
else
{
    if (vsp < 12)
        vsp += grav
    x += hsp
    y += floor(vsp)
}
if (scr_solid(x, (y + 1)) && drop == 0)
    hsp = 0
if (banana == 4)
    instance_destroy()
