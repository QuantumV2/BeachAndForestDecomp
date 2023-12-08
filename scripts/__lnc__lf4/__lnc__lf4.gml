function __lnc__lf4() {
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
            gml_thread_error("Too many arguments for instance_destroy.")
    }
}