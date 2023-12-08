function cutscene_wait() {
    timer++
    if (timer >= argument[0])
    {
        timer = 0
        cutscene_end_action()
    }
}