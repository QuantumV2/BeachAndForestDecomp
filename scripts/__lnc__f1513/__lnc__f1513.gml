function __lnc__f1513() {
    if (argument_count < 1)
        return gml_thread_error(("layer_create needs at least 1 arguments, got " + string(argument_count)));
    else
    {
        switch argument_count
        {
            case 1:
                return layer_create(argument[0]);
            case 2:
                return layer_create(argument[0], argument[1]);
            default:
                return gml_thread_error(("layer_create takes at most 2 arguments, got " + string(argument_count)));
        }
    
    }
}