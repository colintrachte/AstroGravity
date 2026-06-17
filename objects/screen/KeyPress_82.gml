if (room==rm_start)
{
    room_goto_next()
    if instance_exists(music_demo)
    {
        with music_demo
        {
            fluteenabled=1;
            toneenabled=1;
            patternenabled=1;
        }
    }
}
else
{
    room_restart()
}

