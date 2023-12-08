function __lnc__f25() {
    if (argument_count < 1)
        return gml_thread_error(("array_create needs at least 1 arguments, got " + string(argument_count)));
    else
    {
        switch argument_count
        {
            case 1:
                return array_create(argument[0]);
            case 2:
                return array_create(argument[0], argument[1]);
            default:
                return gml_thread_error(("array_create takes at most 2 arguments, got " + string(argument_count)));
        }
    
    }
}