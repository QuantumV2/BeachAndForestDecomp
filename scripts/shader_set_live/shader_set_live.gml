function shader_set_live() {
    var l_sh = argument[0]
    if argument[1]
    {
        if ds_map_exists(global.g_live_shader_live_shaders, l_sh)
            return 0;
        ds_map_set(global.g_live_shader_live_shaders, l_sh, 1)
        var l_i = ds_list_find_index(global.g_live_shader_live_shaders_stop, l_sh)
        if (l_i >= 0)
            ds_list_delete(global.g_live_shader_live_shaders_stop, l_i)
        ds_list_add(global.g_live_shader_live_shaders_start, l_sh)
    }
    else
    {
        if (!(ds_map_exists(global.g_live_shader_live_shaders, l_sh)))
            return 0;
        ds_map_delete(global.g_live_shader_live_shaders, l_sh)
        l_i = ds_list_find_index(global.g_live_shader_live_shaders_start, l_sh)
        if (l_i >= 0)
            ds_list_delete(global.g_live_shader_live_shaders_start, l_i)
        ds_list_add(global.g_live_shader_live_shaders_stop, l_sh)
    }
}