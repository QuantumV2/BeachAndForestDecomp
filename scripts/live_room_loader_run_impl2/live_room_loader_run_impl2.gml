function live_room_loader_run_impl2() {
    var l_rm = argument[0]
    live_log((("Loading " + ds_map_find_value(l_rm, "name")) + "..."))
    ds_map_clear(global.g_live_room_loader_inst_map_gml)
    ds_map_clear(global.g_live_room_loader_inst_map_yy)
    if global.g_live_room_loader_apply_settings
    {
        room_width = ds_map_find_value(ds_map_find_value(l_rm, "roomSettings"), "Width")
        room_height = ds_map_find_value(ds_map_find_value(l_rm, "roomSettings"), "Height")
        live_room_loader_init_physics(ds_map_find_value(l_rm, "physicsSettings"))
    }
    var l_lrs = ds_map_find_value(l_rm, "layers")
    var l_lrk = ds_list_size(l_lrs)
    while (--l_lrk >= 0)
        live_room_loader_add_layer(ds_list_find_value(l_lrs, l_lrk))
    var l__g_list = ds_map_find_value(l_rm, "instanceCreationOrderIDs")
    var l__g_index = 0
    while (l__g_index < ds_list_size(l__g_list))
    {
        var l_id = ds_list_find_value(l__g_list, l__g_index++)
        var l_qinst = ds_map_find_value(global.g_live_room_loader_inst_map_yy, l_id)
        if (l_qinst == undefined)
            live_log((l_id + " is in instanceCreationOrderIDs but no instance exists."))
        else
            live_room_loader_run_yy_inst_cc(ds_map_find_value(global.g_live_room_loader_inst_map_gml, l_id), l_qinst)
    }
    ds_map_clear(global.g_live_room_loader_inst_map_gml)
    ds_map_clear(global.g_live_room_loader_inst_map_yy)
    if global.g_live_room_loader_apply_views
    {
        var l_aval = ds_map_find_value(ds_map_find_value(l_rm, "viewSettings"), "enableViews")
        if (l_aval != undefined)
            view_enabled = l_aval
        else
            view_enabled = false
        var l_qvs = ds_map_find_value(l_rm, "views")
        if (l_qvs != undefined)
        {
            var l_i = 0
            var l__g2 = ds_list_size(l_qvs)
            while (l_i < l__g2)
            {
                var l_qv = ds_list_find_value(l_qvs, l_i)
                if (l_qv == undefined)
                {
                }
                else
                {
                    var l_rv = l_i
                    l_aval = ds_map_find_value(l_qv, "visible")
                    if (l_aval != undefined)
                        view_visible[l_rv] = l_aval
                    else
                        view_visible[l_rv] = false
                    l_aval = ds_map_find_value(l_qv, "xport")
                    if (l_aval != undefined)
                        view_xport[l_rv] = l_aval
                    else
                        view_xport[l_rv] = 0
                    l_aval = ds_map_find_value(l_qv, "yport")
                    if (l_aval != undefined)
                        view_yport[l_rv] = l_aval
                    else
                        view_yport[l_rv] = 0
                    l_aval = ds_map_find_value(l_qv, "wport")
                    if (l_aval != undefined)
                        view_wport[l_rv] = l_aval
                    else
                        view_wport[l_rv] = 1024
                    l_aval = ds_map_find_value(l_qv, "hport")
                    if (l_aval != undefined)
                        view_hport[l_rv] = l_aval
                    else
                        view_hport[l_rv] = 768
                    var l_rc = view_camera[l_rv]
                    var l_vx = ds_map_find_value(l_qv, "xview")
                    if (l_vx == undefined)
                        l_vx = 0
                    var l_vy = ds_map_find_value(l_qv, "yview")
                    if (l_vy == undefined)
                        l_vy = 0
                    camera_set_view_pos(l_rc, (global.g_live_room_loader_room_x + l_vx), (global.g_live_room_loader_room_y + l_vy))
                    l_vx = ds_map_find_value(l_qv, "wview")
                    if (l_vx == undefined)
                        l_vx = 1024
                    l_vy = ds_map_find_value(l_qv, "hview")
                    if (l_vy == undefined)
                        l_vy = 768
                    camera_set_view_size(l_rc, l_vx, l_vy)
                    l_aval = ds_map_find_value(l_qv, "obj")
                    if (l_aval != undefined)
                        camera_set_view_target(l_rc, asset_get_index(l_aval))
                    l_vx = ds_map_find_value(l_qv, "hspeed")
                    if (l_vx == undefined)
                        l_vx = -1
                    l_vy = ds_map_find_value(l_qv, "vspeed")
                    if (l_vy == undefined)
                        l_vy = -1
                    camera_set_view_speed(l_rc, l_vx, l_vy)
                    l_vx = ds_map_find_value(l_qv, "hborder")
                    if (l_vx == undefined)
                        l_vx = 32
                    l_vy = ds_map_find_value(l_qv, "vborder")
                    if (l_vy == undefined)
                        l_vy = 32
                    camera_set_view_border(l_rc, l_vx, l_vy)
                }
                l_i++
            }
        }
    }
    var l_s = ds_map_find_value(l_rm, "creationCode")
    if (l_s != undefined && l_s != "")
        live_room_loader_run_cc(l_s, (ds_map_find_value(l_rm, "name") + ":CreationCode"))
}