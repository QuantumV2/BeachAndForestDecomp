if (state != (118 << 0) && state != (59 << 0))
    return;
var my_id = id
var other_baddie = other.id
var can_parry = 0
with (other_baddie)
{
    if (instance_exists(baddieID) && baddieID.thrown == 1 && baddieID != other.id)
    {
        var _maxhsp = abs(baddieID.hsp)
        var _dir = sign(baddieID.hsp)
        if (x != my_id.x)
            _dir = sign((x - my_id.x))
        baddieID.hsp = (_maxhsp * _dir)
        can_parry = 1
    }
}
if (can_parry && state != (118 << 0) && other.baddieID != id)
{
    sprite_index = parryspr
    movespeed = 8
    state = (118 << 0)
    image_index = 0
}
