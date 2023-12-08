with (other.id)
{
    if (shotgunAnim == 1)
    {
        shotgunAnim = 0
        with (instance_create(x, y, obj_sausageman_dead))
            sprite_index = spr_shotgunback
    }
}
