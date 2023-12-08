function cutscene_customer_end() {
    var player = argument[0]
    var _gnomeid = argument[1]
    var finish = 0
    with (player)
    {
        var depth_obj = other.id
        if (sprite_index == spr_player_throw)
        {
            if (floor(image_index) == 1 && (!instance_exists(obj_pizzacustomer)))
            {
                global.pizzadelivery = 0
                with (instance_create(x, y, obj_pizzacustomer))
                {
                    depth = depth_obj.depth
                    hsp = (other.xscale * 2.2)
                    vsp = -8
                }
            }
            if (image_index > (image_number - 1))
                sprite_index = spr_idle
        }
    }
    if instance_exists(obj_pizzacustomer)
    {
        with (obj_pizzacustomer)
        {
            if grounded
                finish = 1
        }
    }
    if finish
    {
        with (obj_customeractor)
            happy = 1
        with (player)
            state = (0 << 0)
        with (obj_gnome_checklist)
            gnome_check[_gnomeid] = 1
        if instance_exists(obj_gnomecustomerblock)
            instance_destroy(obj_gnomecustomerblock)
        global.pizzasdelivered++
        cutscene_end_action()
    }
}