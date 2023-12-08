function live_room_loader_run_yy_inst_cc() {
    var l_qinst = argument[1]
    with (argument[0])
    {
        var l_rname = ds_map_find_value(l_qinst, "name")
        event_perform(ev_pre_create, 0)
        var l_rcc = ds_map_find_value(l_qinst, "propertyCode")
        if (l_rcc != undefined && l_rcc != "")
            live_room_loader_run_cc(l_rcc, (l_rname + ":Properties"))
        event_perform(ev_create, 0)
        l_rcc = ds_map_find_value(l_qinst, "creationCode")
        if (l_rcc != undefined && l_rcc != "")
            live_room_loader_run_cc(l_rcc, (l_rname + ":CreationCode"))
    }
}