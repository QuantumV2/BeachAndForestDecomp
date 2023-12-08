if (other.state == (29 << 0) || other.state == (55 << 0))
{
    instance_create((x + (obj_player1.xscale * 40)), y, obj_punchdust)
    with (other.id)
    {
        image_index = 0
        sprite_index = spr_haulingstart
        baddiegrabbedID = other.id
        state = (54 << 0)
    }
    playerid = other.object_index
    grabbed = 1
}
if (other.state == (78 << 0) || other.state == (92 << 0) || (other.state == (45 << 0) && grounded))
{
    instance_create(x, y, obj_genericpoofeffect)
    with (other.id)
    {
        vsp = 0
        mask_index = spr_crouchmask
        x = other.x
        y = other.y
        state = (87 << 0)
        sprite_index = spr_player_barrelroll
        movespeed = 12
    }
    instance_destroy()
}
