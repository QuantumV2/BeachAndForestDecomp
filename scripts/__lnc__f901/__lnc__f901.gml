function __lnc__f901() {
    if (argument_count < 2)
        return gml_thread_error(("ds_grid_read needs at least 2 arguments, got " + string(argument_count)));
    else
    {
        switch argument_count
        {
            case 2:
                return ds_grid_read(argument[0], argument[1]);
            case 3:
                return ds_grid_read(argument[0], argument[1], argument[2]);
            default:
                return gml_thread_error(("ds_grid_read takes at most 3 arguments, got " + string(argument_count)));
        }
    
    }
}