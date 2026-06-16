if (alarm0<=0) && !screen.intro_is_done
{
    if visible
    {
        event_perform(ev_other,ev_user0)
    }
}
else
{
    alarm0-=screen.sec;
}

