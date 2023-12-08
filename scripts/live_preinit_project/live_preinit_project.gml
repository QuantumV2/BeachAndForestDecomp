function live_preinit_project() {
    gml_func_add("live_call(...):", global.f_live_preinit_project_fake_call)
    gml_func_add("live_defcall(...):", global.f_live_preinit_project_fake_call)
    gml_func_add("live_call_ext(...):", global.f_live_preinit_project_fake_call)
    gml_func_add("live_defcall_ext(...):", global.f_live_preinit_project_fake_call)
    gml_func_add("live_execute_string(:string):", global.f_live_execute_string)
    gml_func_add("sprite_set_live(spr:index, status:bool)", global.f_sprite_set_live)
    gml_func_add("room_goto_live(rm:index)", global.f_room_goto_live)
}