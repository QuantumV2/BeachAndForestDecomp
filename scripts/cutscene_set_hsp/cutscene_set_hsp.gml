function cutscene_set_hsp() {
    var _obj = argument[0]
    var _hsp = argument[1]
    with (_obj)
        hsp = _hsp
    cutscene_end_action()
}