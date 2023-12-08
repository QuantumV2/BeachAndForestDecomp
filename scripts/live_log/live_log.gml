function live_log() {
    script_execute(global.g_live_log_script, ((("[live][" + date_time_string(date_current_datetime())) + "] ") + argument[0]))
}