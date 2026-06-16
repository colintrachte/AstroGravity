x2=device_mouse_x_to_gui(0);
y2=device_mouse_y_to_gui(0);

dist=point_distance(x,y,x2,y2);
dt=(1-(dist/(32)))*(dist<32);

if speed>0
{
    event_perform(ev_other,ev_user0)
}

if x<margin
{
    if o_ship_creator.page
    {
        //items from a previous screen cannot be deleted by dragging
        if material
        {
            x=margin;
        }
        else
        {
            if visible && !dragdrop
            {
                instance_destroy()
            }
            else
            {
                x=margin;
            }
        }
    }
    else
    {
        //if the user is not dragging the item
        if !dragdrop
        {
            x=margin;
        }
    }
    
}

if x>(__view_get( e__VW.WPort, 0 )/2)
{
    x=(__view_get( e__VW.WPort, 0 )/2);
}

if y>__view_get( e__VW.HPort, 0 )-32
{
    y=__view_get( e__VW.HPort, 0 )-32;
}

if y<32
{
    y=32;
}


