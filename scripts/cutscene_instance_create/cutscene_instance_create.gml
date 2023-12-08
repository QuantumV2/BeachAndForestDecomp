function cutscene_instance_create() {
    var _obj = argument[0]
    var xx = argument[1]
    var yy = argument[2]
    var _xscale = argument[3]
    with (instance_create(xx, yy, _obj))
    {
        depth = other.depth
        image_xscale = _xscale
        xscale = _xscale
    }
    cutscene_end_action()
}