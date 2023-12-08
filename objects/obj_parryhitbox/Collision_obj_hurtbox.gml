if (other.object_index == obj_spitcheesespike || other.object_index == obj_banditochicken_projectile || other.object_index == obj_robotknife)
{
    with (other.id)
    {
        var current_hspd = abs(hsp)
        var _dir = sign(hsp)
        if (x != other.x)
            _dir = sign((x - other.x))
        hsp = (_dir * current_hspd)
    }
}
else if (other.object_index == obj_noisegoblin_arrow)
{
    with (other.id)
    {
        current_hspd = abs(speed)
        _dir = sign(speed)
        if (((direction < 90 || direction > 270) && x < other.x) || ((direction > 90 || direction < 270) && x > other.x))
            _dir = -1
        speed = (_dir * speed)
    }
}
if (!collisioned)
    event_user(0)
