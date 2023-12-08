with (obj_player)
{
    if (state == (5 << 0) || state == (25 << 0) || state == (45 << 0) || state == (92 << 0) || state == (78 << 0))
    {
        other.image_speed = 0.35
        if (xscale != other.image_xscale)
            xscale = other.image_xscale
    }
}
