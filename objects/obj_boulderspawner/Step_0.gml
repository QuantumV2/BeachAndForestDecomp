if ((!instance_exists(boulderID)) && cooldown == 0)
{
    with (instance_create(x, y, obj_boulder))
    {
        image_xscale = other.image_xscale
        other.boulderID = id
    }
    cooldown = 200
}
if (cooldown > 0)
    cooldown--
