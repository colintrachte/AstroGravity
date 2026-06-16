if dragdrop
{
    if point_distance(x1,y1,x2,y2)>radius*.5
    {
        glue_to_point(x2,y2)
    }
    event_perform(ev_other,ev_user0)
}

