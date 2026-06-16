camera_target_step()

//camera script
if abs(xtarget-x)>zoom_min
{
    x+=(xtarget-x)*zoom_rate;
}

if abs(ytarget-y)>zoom_min
{
    y+=(ytarget-y)*zoom_rate;
}

if pivot_enabled
{
    var difference=angle_difference(dirtarget,direction);
    if abs(difference)>zoom_rate
    {
        direction+=difference*zoom_rate*.1;
    }
}

if abs(zoom_target-zoom)>.01
{
    zoom+=(zoom_target-zoom)*zoom_rate;
}

zoom_percent=(zoom-zoom_min)/(zoom_max-zoom_min);

view_zoom(zoom)
view_center(x,y,shake,direction)