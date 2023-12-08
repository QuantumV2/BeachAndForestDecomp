function cutscene_set_sprite() {
    var _obj = argument[0]
    var _spr = argument[1]
    var _spd = argument[2]
    var _xscale = argument[3]
    with (_obj)
    {
        sprite_index = _spr
        image_speed = _spd
        image_xscale = _xscale
        image_index = 0
        xscale = _xscale
    }
    cutscene_end_action()
}