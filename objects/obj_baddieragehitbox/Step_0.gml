if instance_exists(ID)
{
    x = ID.x
    y = ID.y
    image_xscale = ID.image_xscale
    image_index = ID.image_index
    with (ID)
    {
        if (state != (96 << 0))
        {
            ragehitbox = 0
            instance_destroy(other.id)
        }
    }
}
else
    instance_destroy()
