function live_room_loader_add_layer() {
    var l_ql = argument[0]
    var l_ql_depth = ds_map_find_value(l_ql, "depth")
    var l_ql_name = ds_map_find_value(l_ql, "name")
    switch ds_map_find_value(l_ql, "modelName")
    {
        case "GMRLayer":
            var l_rl = layer_get_id(l_ql_name)
            if (l_rl == -1)
            {
                l_rl = layer_create(l_ql_depth, l_ql_name)
                if (ds_map_find_value(l_ql, "visible") != undefined)
                    layer_set_visible(l_rl, ds_map_find_value(l_ql, "visible"))
            }
            var l_sublayers = ds_map_find_value(l_ql, "layers")
            var l_i1 = ds_list_size(l_sublayers)
            while (--l_i1 >= 0)
                live_room_loader_add_layer(ds_list_find_value(l_sublayers, l_i1))
            break
        case "GMRBackgroundLayer":
            if global.g_live_room_loader_apply_backgrounds
            {
                l_rl = layer_get_id(l_ql_name)
                if (l_rl == -1)
                {
                    l_rl = layer_create(l_ql_depth, l_ql_name)
                    if (ds_map_find_value(l_ql, "visible") != undefined)
                        layer_set_visible(l_rl, ds_map_find_value(l_ql, "visible"))
                }
                var l_qb = l_ql
                var l_s = ds_map_find_value(l_qb, "sprite")
                var l_rb = layer_background_create(l_rl, (l_s != undefined ? asset_get_index(l_s) : -1))
                var l_aval = ds_map_find_value(l_qb, "color")
                if (l_aval != undefined)
                {
                    layer_background_blend(l_rb, (l_aval & 16777215))
                    layer_background_alpha(l_rb, ((l_aval >> 24) / 255))
                }
                l_aval = ds_map_find_value(l_qb, "htiled")
                if (l_aval != undefined)
                    layer_background_htiled(l_rb, l_aval)
                else
                    layer_background_htiled(l_rb, 1)
                l_aval = ds_map_find_value(l_qb, "vtiled")
                if (l_aval != undefined)
                    layer_background_vtiled(l_rb, l_aval)
                else
                    layer_background_vtiled(l_rb, 1)
                l_aval = ds_map_find_value(l_qb, "stretch")
                if (l_aval != undefined)
                    layer_background_stretch(l_rb, l_aval)
                else
                    layer_background_stretch(l_rb, 0)
                l_aval = ds_map_find_value(l_qb, "animationFPS")
                if (l_aval != undefined)
                    layer_background_speed(l_rb, live_room_loader_anim_speed(l_aval, ds_map_find_value(l_qb, "animationSpeedType")))
                l_aval = ds_map_find_value(l_qb, "x")
                if (l_aval == undefined)
                    l_aval = 0
                layer_x(l_rl, (global.g_live_room_loader_room_x + l_aval))
                l_aval = ds_map_find_value(l_qb, "y")
                if (l_aval == undefined)
                    l_aval = 0
                layer_y(l_rl, (global.g_live_room_loader_room_y + l_aval))
            }
            break
        case "GMRTileLayer":
            if global.g_live_room_loader_apply_tiles
            {
                l_rl = layer_get_id(l_ql_name)
                if (l_rl == -1)
                {
                    l_rl = layer_create(l_ql_depth, l_ql_name)
                    if (ds_map_find_value(l_ql, "visible") != undefined)
                        layer_set_visible(l_rl, ds_map_find_value(l_ql, "visible"))
                }
                var l_qt = l_ql
                var l_qtt = ds_map_find_value(l_qt, "tiles")
                var l_qtw = ds_map_find_value(l_qtt, "SerialiseWidth")
                var l_qth = ds_map_find_value(l_qtt, "SerialiseHeight")
                var l_rt = layer_tilemap_create(l_rl, (global.g_live_room_loader_room_x + ds_map_find_value(l_qt, "x")), (global.g_live_room_loader_room_y + ds_map_find_value(l_qt, "y")), asset_get_index(ds_map_find_value(l_qt, "tileset")), l_qtw, l_qth)
                var l_qtd = ds_map_find_value(l_qtt, "TileSerialiseData")
                var l_qti = 0
                var l_y1 = 0
                var l__g1 = l_qth
                while (l_y1 < l__g1)
                {
                    var l_x1 = 0
                    var l__g11 = l_qtw
                    while (l_x1 < l__g11)
                    {
                        tilemap_set(l_rt, ds_list_find_value(l_qtd, l_qti++), l_x1, l_y1)
                        l_x1++
                    }
                    l_y1++
                }
            }
            break
        case "GMRInstanceLayer":
            if global.g_live_room_loader_apply_instances
            {
                l_rl = layer_get_id(l_ql_name)
                if (l_rl == -1)
                {
                    l_rl = layer_create(l_ql_depth, l_ql_name)
                    if (ds_map_find_value(l_ql, "visible") != undefined)
                        layer_set_visible(l_rl, ds_map_find_value(l_ql, "visible"))
                }
                var l_qi = l_ql
                var l_rx = global.g_live_room_loader_room_x
                var l_ry = global.g_live_room_loader_room_y
                var l_instances = ds_map_find_value(l_qi, "instances")
                var l_n = ds_list_size(l_instances)
                var l_base = global.g_live_blank_object
                if (l_n != 0)
                {
                    if (!object_exists(l_base))
                        show_error("Please add a blank object and set live_blank_object to point at it in obj_gmlive's create event.", 0)
                }
                var l_lco = global.g_live_room_loader_object_cache
                var l_i = -1
                while (++l_i < l_n)
                {
                    var l_qinst = ds_list_find_value(l_instances, l_i)
                    var l_rnext = instance_create_layer((l_rx + ds_map_find_value(l_qinst, "x")), (l_ry + ds_map_find_value(l_qinst, "y")), l_rl, l_base)
                    var l_qid = ds_map_find_value(l_qinst, "name")
                    ds_map_set(global.g_live_room_loader_inst_map_yy, l_qid, l_qinst)
                    ds_map_set(global.g_live_room_loader_inst_map_gml, l_qid, l_rnext)
                    with (l_rnext)
                    {
                        gml_const_add(ds_map_find_value(l_qinst, "name"), id)
                        l_aval = ds_map_find_value(l_qinst, "rotation")
                        if (l_aval != undefined)
                            image_angle = l_aval
                        l_aval = ds_map_find_value(l_qinst, "scaleX")
                        if (l_aval != undefined)
                            image_xscale = l_aval
                        l_aval = ds_map_find_value(l_qinst, "scaleY")
                        if (l_aval != undefined)
                            image_yscale = l_aval
                        var l_f = ds_map_find_value(l_qinst, "color")
                        if (l_f != undefined)
                        {
                            image_blend = (l_f & 16777215)
                            image_alpha = ((l_f >> 24) / 255)
                        }
                        l_s = ds_map_find_value(l_qinst, "obj")
                        var l_id1 = ds_map_find_value(l_lco, l_s)
                        if (l_id1 == undefined)
                        {
                            l_id1 = asset_get_index(l_s)
                            ds_map_set(l_lco, l_s, l_id1)
                        }
                        instance_change(l_id1, false)
                    }
                }
            }
            break
        case "GMRAssetLayer":
            if global.g_live_room_loader_apply_sprites
            {
                l_rl = layer_get_id(l_ql_name)
                if (l_rl == -1)
                {
                    l_rl = layer_create(l_ql_depth, l_ql_name)
                    if (ds_map_find_value(l_ql, "visible") != undefined)
                        layer_set_visible(l_rl, ds_map_find_value(l_ql, "visible"))
                }
                var l_sprites = ds_map_find_value(l_ql, "assets")
                l_n = ds_list_size(l_sprites)
                var l_lcs = global.g_live_room_loader_sprite_cache
                l_rx = global.g_live_room_loader_room_x
                l_ry = global.g_live_room_loader_room_y
                l_i = -1
                while (++l_i < l_n)
                {
                    var l_qspr = ds_list_find_value(l_sprites, l_i)
                    l_s = ds_map_find_value(l_qspr, "sprite")
                    var l_rspr = (l_rx + ds_map_find_value(l_qspr, "x"))
                    var l_rspr1 = (l_ry + ds_map_find_value(l_qspr, "y"))
                    var l_id = ds_map_find_value(l_lcs, l_s)
                    if (l_id == undefined)
                    {
                        l_id = asset_get_index(l_s)
                        ds_map_set(l_lcs, l_s, l_id)
                    }
                    var l_rspr2 = layer_sprite_create(l_rl, l_rspr, l_rspr1, l_id)
                    l_aval = ds_map_find_value(l_qspr, "frameIndex")
                    if (l_aval != undefined)
                        layer_sprite_index(l_rspr2, l_aval)
                    l_aval = ds_map_find_value(l_qspr, "scaleX")
                    if (l_aval != undefined)
                        layer_sprite_xscale(l_rspr2, l_aval)
                    l_aval = ds_map_find_value(l_qspr, "scaleY")
                    if (l_aval != undefined)
                        layer_sprite_yscale(l_rspr2, l_aval)
                    l_aval = ds_map_find_value(l_qspr, "rotation")
                    if (l_aval != undefined)
                        layer_sprite_angle(l_rspr2, l_aval)
                    l_f = ds_map_find_value(l_qspr, "color")
                    if (l_f != undefined)
                    {
                        layer_sprite_blend(l_rspr2, (l_f & 16777215))
                        layer_sprite_alpha(l_rspr2, ((l_f >> 24) / 255))
                    }
                    if ds_map_find_value(l_qspr, "userdefined_animFPS")
                        layer_sprite_speed(l_rspr2, live_room_loader_anim_speed(ds_map_find_value(l_qspr, "animationFPS"), ds_map_find_value(l_qspr, "animationSpeedType")))
                }
            }
            break
    }
}