function __lnc__f787() {
    if (argument_count < 2)
    {
        gml_thread_error(("ds_stack_push needs at least 2 arguments, got " + string(argument_count)))
        return 0;
    }
    else
    {
        switch argument_count
        {
            case 2:
                ds_stack_push(argument[0], argument[1])
                break
            case 3:
                ds_stack_push(argument[0], argument[1], argument[2])
                break
            case 4:
                ds_stack_push(argument[0], argument[1], argument[2], argument[3])
                break
            case 5:
                ds_stack_push(argument[0], argument[1], argument[2], argument[3], argument[4])
                break
            case 6:
                ds_stack_push(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5])
                break
            case 7:
                ds_stack_push(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6])
                break
            case 8:
                ds_stack_push(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7])
                break
            case 9:
                ds_stack_push(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8])
                break
            case 10:
                ds_stack_push(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9])
                break
            case 11:
                ds_stack_push(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10])
                break
            case 12:
                ds_stack_push(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11])
                break
            case 13:
                ds_stack_push(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12])
                break
            case 14:
                ds_stack_push(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12], argument[13])
                break
            case 15:
                ds_stack_push(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12], argument[13], argument[14])
                break
            case 16:
                ds_stack_push(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12], argument[13], argument[14], argument[15])
                break
            case 17:
                ds_stack_push(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12], argument[13], argument[14], argument[15], argument[16])
                break
            default:
                gml_thread_error(("ds_stack_push takes at most 18 arguments, got " + string(argument_count)))
        }
    
    }
}