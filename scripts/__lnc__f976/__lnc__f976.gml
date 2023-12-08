function __lnc__f976() {
    switch argument_count
    {
        case 0:
            matrix_stack_push()
            break
        case 1:
            matrix_stack_push(argument[0])
            break
        case 2:
            matrix_stack_push(argument[0], argument[1])
            break
        case 3:
            matrix_stack_push(argument[0], argument[1], argument[2])
            break
        case 4:
            matrix_stack_push(argument[0], argument[1], argument[2], argument[3])
            break
        case 5:
            matrix_stack_push(argument[0], argument[1], argument[2], argument[3], argument[4])
            break
        case 6:
            matrix_stack_push(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5])
            break
        case 7:
            matrix_stack_push(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6])
            break
        case 8:
            matrix_stack_push(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7])
            break
        case 9:
            matrix_stack_push(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8])
            break
        case 10:
            matrix_stack_push(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9])
            break
        case 11:
            matrix_stack_push(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10])
            break
        case 12:
            matrix_stack_push(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11])
            break
        case 13:
            matrix_stack_push(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12])
            break
        case 14:
            matrix_stack_push(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12], argument[13])
            break
        case 15:
            matrix_stack_push(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12], argument[13], argument[14])
            break
        default:
            gml_thread_error(("matrix_stack_push takes at most 16 arguments, got " + string(argument_count)))
    }
}