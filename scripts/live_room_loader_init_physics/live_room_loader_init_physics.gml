function live_room_loader_init_physics() {
    var l_phs = argument[0]
    if (l_phs == undefined)
        return 0;
    if ds_map_find_value(l_phs, "PhysicsWorld")
    {
        global.g_live_room_loader_use_physics = 1
        physics_world_create(ds_map_find_value(l_phs, "PhysicsWorldPixToMeters"))
        physics_world_gravity(ds_map_find_value(l_phs, "PhysicsWorldGravityX"), ds_map_find_value(l_phs, "PhysicsWorldGravityY"))
    }
    else
        global.g_live_room_loader_use_physics = 0
}