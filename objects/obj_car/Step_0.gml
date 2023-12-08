var mach = 0
with (obj_player)
{
    if (state == (92 << 0))
        mach = 1
}
if (!mach)
{
    if (!instance_exists(inst))
    {
        inst = instance_create(x, y, obj_solid)
        with (inst)
        {
            sprite_index = spr_car_solid
            mask_index = spr_car_solid
        }
    }
}
else if instance_exists(inst)
{
    instance_destroy(inst)
    inst = noone
}
if place_meeting(x, y, obj_player)
{
    inst = instance_place(x, y, obj_player)
    hsp = sign(inst.hsp)
    if (inst.state == (92 << 0))
        instance_destroy()
}
