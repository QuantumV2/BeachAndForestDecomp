var _obj = other.id
if (state != (109 << 0))
{
    can_flash = 1
    can_flash_count = can_flash_max
    state = (109 << 0)
    stunned = 15
    hsp = (sign((x - _obj.x)) * 1)
    if (x != _obj.x)
        image_xscale = (-(sign((x - _obj.x))))
    inv_timer = inv_max
    invincible = 1
    vsp = -5
    hp -= 1
    if (hp <= 0)
        instance_destroy()
}
