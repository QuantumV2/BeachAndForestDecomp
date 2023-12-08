function __lnc__f234() {
    switch argument_count
    {
        case 0:
            instance_destroy()
            break
        case 1:
            instance_destroy(argument[0])
            break
        case 2:
            instance_destroy(argument[0], argument[1])
            break
        default:
            gml_thread_error(("instance_destroy takes at most 2 arguments, got " + string(argument_count)))
    }
}