function __lnc__f68() {
    switch argument_count
    {
        case 0:
            return median();
        case 1:
            return median(argument[0]);
        case 2:
            return median(argument[0], argument[1]);
        case 3:
            return median(argument[0], argument[1], argument[2]);
        case 4:
            return median(argument[0], argument[1], argument[2], argument[3]);
        case 5:
            return median(argument[0], argument[1], argument[2], argument[3], argument[4]);
        case 6:
            return median(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5]);
        case 7:
            return median(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6]);
        case 8:
            return median(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7]);
        case 9:
            return median(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8]);
        case 10:
            return median(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9]);
        case 11:
            return median(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10]);
        case 12:
            return median(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11]);
        case 13:
            return median(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12]);
        case 14:
            return median(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12], argument[13]);
        case 15:
            return median(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12], argument[13], argument[14]);
        default:
            return gml_thread_error(("median takes at most 16 arguments, got " + string(argument_count)));
    }
}