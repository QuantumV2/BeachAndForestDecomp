with (instance_place((x - 1), y, obj_player))
{
    if (state == (11 << 0) && other.eaten == 0)
    {
        other.eaten = 1
        other.x = -100
        other.y = -100
        other.sprite_index = spr_corneaten
        grav = 0.5
        state = (0 << 0)
    }
}
with (instance_place((x + 1), y, obj_player))
{
    if (state == (11 << 0) && other.eaten == 0)
    {
        other.eaten = 1
        other.x = -100
        other.y = -100
        other.sprite_index = spr_corneaten
        grav = 0.5
        state = (0 << 0)
    }
}
if (instance_exists(obj_mort) && eaten == 1)
{
    x = xstart
    y = ystart
    eaten = 0
    sprite_index = spr_corn
}
