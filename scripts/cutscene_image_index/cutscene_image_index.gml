function cutscene_image_index() {
    var _obj = argument[0]
    var _index = argument[1]
    with (_obj)
        image_index = _index
    cutscene_end_action()
}