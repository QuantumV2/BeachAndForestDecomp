function cutscene_move_actor() {
    var _obj = argument[0]
    var xx = argument[1]
    var yy = argument[2]
    var interp = argument[3]
    var finish = 0
    with (_obj)
    {
        x = lerp(x, xx, interp)
        y = lerp(y, yy, interp)
        if (x > (xx - 6) && x < (xx + 6) && y > (yy - 6) && y < (yy + 6))
            finish = 1
    }
    if finish
        cutscene_end_action()
}