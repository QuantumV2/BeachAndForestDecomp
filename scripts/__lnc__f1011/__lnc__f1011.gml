function __lnc__f1011() {
    if (argument_count < 1)
    {
        gml_thread_error(("gpu_set_fog needs at least 1 arguments, got " + string(argument_count)))
        return 0;
    }
    else
    {
        switch argument_count
        {
            case 1:
                gpu_set_fog(argument[0])
                break
            case 2:
                gpu_set_fog(argument[0], argument[1])
                break
            case 3:
                gpu_set_fog(argument[0], argument[1], argument[2])
                break
            case 4:
                gpu_set_fog(argument[0], argument[1], argument[2], argument[3])
                break
            default:
                gml_thread_error(("gpu_set_fog takes at most 4 arguments, got " + string(argument_count)))
        }
    
    }
}