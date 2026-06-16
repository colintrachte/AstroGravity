if point_distance(window_mouse_get_x(),window_mouse_get_y(),x,y)<radius
{
    if instance_exists(o_ship_colorslider)
    {
        image_blend=o_ship_colorslider.image_blend;
    }
}

if dragdrop
{
    dragdrop=0;
    x1=x;
    y1=y;
    event_perform(ev_other,ev_user0)
    if x<margin
    {
        //on the first page, the user may erase points by
        //dragging them back to the sidebar
        if !o_ship_creator.page
        {
            instance_destroy()
            if index>0
            {
                ds_list_delete(o_ship_creator.points_list,ds_list_find_index(o_ship_creator.points_list,id))
            }
        }
    }
    else
    {
        with o_ship_creator
        {
            if connector
            {
                if other.index<0
                {
                    ds_list_add(points_list,other.id)
                    other.index=1;
                }
                else
                {
                    ds_list_delete(points_list,ds_list_find_index(points_list,other.id))
                    other.index=-1;
                }
            }
        }
    }
}

