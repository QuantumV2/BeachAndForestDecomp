if (character == "V")
    scr_hurtplayer(object_index)
var b = 1
for (i = 0; i < (array_length_1d(transformation) - 1); i += 1)
{
    if (state == transformation[i])
        b = 0
}
if (b == 1)
{
    if (cutscene == 0 && other.grounded == 1 && state != (34 << 0) && (state == (29 << 0) || state == (55 << 0) || character == "S"))
    {
        bombpeptimer = 100
        state = (34 << 0)
        image_index = 0
        sprite_index = spr_bombpepintro
        instance_destroy(other.id)
    }
    if (hurted == 0 && other.grounded == 0)
    {
        instance_destroy(other.id)
        instance_create(x, y, obj_bombexplosion)
    }
}
