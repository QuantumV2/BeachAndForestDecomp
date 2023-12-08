function cutscene_customer_start() {
    var player = argument[0]
    with (player)
    {
        hsp = 0
        state = (117 << 0)
        var customerdoor = instance_nearest(x, y, obj_gnomecustomer)
        if (customerdoor.x != x)
            xscale = (-(sign((x - customerdoor.x))))
    }
    cutscene_end_action()
}