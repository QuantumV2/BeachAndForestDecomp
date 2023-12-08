var player = other.id
with (player)
{
    if (state != (39 << 0))
    {
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_baddiegibs)
        state = (39 << 0)
        sprite_index = spr_squished
        image_index = 0
        scr_losepoints()
    }
}
