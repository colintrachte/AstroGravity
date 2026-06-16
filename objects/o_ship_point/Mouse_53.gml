if visible && movable && point_distance(window_mouse_get_x(),window_mouse_get_y(),x,y)<radius
{
    x1=device_mouse_x_to_gui(0);
    y1=device_mouse_y_to_gui(0);
    dragdrop=1;
}

