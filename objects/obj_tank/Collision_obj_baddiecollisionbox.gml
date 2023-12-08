var _tank = id
var _baddie = other.id
with (_baddie)
{
    if (instance_exists(baddieID) && baddieID != other.id)
    {
        if (baddieID.state == (109 << 0) && baddieID.thrown == 1)
        {
            with (_tank)
            {
                if (state != (119 << 0) && thrown == 0 && (!invincible) && state != (109 << 0))
                {
                    can_flash = 1
                    can_flash_count = can_flash_max
                    state = (109 << 0)
                    stunned = 30
                    hsp = (sign((x - _baddie.x)) * 2)
                    if (x != _baddie.x)
                        image_xscale = (-(sign((x - _baddie.x))))
                    inv_timer = inv_max
                    invincible = 1
                    vsp = -5
                    hp -= 3
                    if (hp <= 0)
                        instance_destroy()
                }
            }
        }
    }
}
