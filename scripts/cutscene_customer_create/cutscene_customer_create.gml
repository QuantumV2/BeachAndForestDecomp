function cutscene_customer_create() {
    var xx = argument[0]
    var yy = argument[1]
    var _idle = argument[2]
    var _happy = argument[3]
    var _xscale = argument[4]
    with (instance_create(xx, yy, obj_customeractor))
    {
        image_xscale = _xscale
        depth = (other.depth - 1)
        sprite_index = _idle
        spr_idle = _idle
        spr_happy = _happy
    }
    cutscene_end_action()
}