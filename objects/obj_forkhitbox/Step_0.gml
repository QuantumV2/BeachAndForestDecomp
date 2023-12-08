if ((!instance_exists(ID)) && room != custom_lvl_room)
    instance_destroy()
if instance_exists(ID)
{
    x = ID.x
    y = ID.y
    image_xscale = ID.image_xscale
    image_index = ID.image_index
    with (ID)
    {
        if (object_index == obj_coolpineapple || object_index == obj_forknight || object_index == obj_noisey)
        {
            if (state != (105 << 0))
            {
                hitboxcreate = 0
                instance_destroy(other.id)
            }
        }
        if (object_index == obj_indiancheese)
        {
            if (state != (105 << 0) && sprite_index != spr_indiancheese_howl)
            {
                hitboxcreate = 0
                instance_destroy(other.id)
            }
        }
        if (object_index == obj_weeniesquire)
        {
            if (stun == 1)
            {
                hitboxcreate = 0
                instance_destroy(other.id)
            }
        }
        if (object_index == obj_boulder)
        {
            if (hitwall == 0)
                instance_destroy(other.id)
        }
        if (object_index == obj_snickexe)
        {
            if (obj_player1.instakillmove == 1 || obj_player1.state == (29 << 0))
            {
                instance_destroy(other.id)
                hitboxcreate = 0
            }
        }
        if (object_index == obj_pickle)
        {
            if (state != (100 << 0))
                instance_destroy(other.id)
        }
        if (object_index == obj_noisecrusher)
        {
            if (state != (98 << 0))
            {
                hitboxcreate = 0
                instance_destroy(other.id)
            }
        }
        if (object_index == obj_peasanto || object_index == obj_fencer || object_index == obj_ninja || object_index == obj_pizzice || object_index == obj_ancho)
        {
            if (state != (99 << 0))
            {
                hitboxcreate = 0
                instance_destroy(other.id)
            }
        }
    }
}
