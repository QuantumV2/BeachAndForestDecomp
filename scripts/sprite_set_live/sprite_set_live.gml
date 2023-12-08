function sprite_set_live() {
    var l_spr = argument[0]
    if argument[1]
    {
        if ds_map_exists(global.g_live_live_sprites, l_spr)
            return 0;
        ds_map_set(global.g_live_live_sprites, l_spr, 1)
        var l_i = ds_list_find_index(global.g_live_live_sprites_stop, l_spr)
        if (l_i >= 0)
            ds_list_delete(global.g_live_live_sprites_stop, l_i)
        ds_list_add(global.g_live_live_sprites_start, l_spr)
    }
    else
    {
        if (!(ds_map_exists(global.g_live_live_sprites, l_spr)))
            return 0;
        ds_map_delete(global.g_live_live_sprites, l_spr)
        l_i = ds_list_find_index(global.g_live_live_sprites_start, l_spr)
        if (l_i >= 0)
            ds_list_delete(global.g_live_live_sprites_start, l_i)
        ds_list_add(global.g_live_live_sprites_stop, l_spr)
    }
}