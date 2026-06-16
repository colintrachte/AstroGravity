/// @description each type of button has its own event when clicked
if visible && point_distance(window_mouse_get_x(),window_mouse_get_y(),x,y)<radius
{
    event_perform(ev_other,event[action])
}

