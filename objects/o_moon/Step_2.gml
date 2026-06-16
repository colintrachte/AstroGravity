//see alarm 4 for intermittent step code
if (visible)
{
    var x1,y1,x2,y2;
    x1=__view_get( e__VW.XView, 0 )-diameter;
    y1=__view_get( e__VW.YView, 0 )-diameter;
    x2=__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+diameter;
    y2=__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )+diameter;
    in_view=point_in_rectangle(x,y,x1,y1,x2,y2);
    image_angle+=spin*screen.sec;
    path_rotate(path,-spin*screen.sec);
    
    if !orphan
    {
        if instance_exists(parent_id)
        {
            orbit_speed=.05*path_get_speed(orbit_path,pos)/orbit_circumference
            x=parent_id.x+path_get_x(orbit_path,pos);
            y=parent_id.y+path_get_y(orbit_path,pos);
            orbit_angle=point_direction(parent_id.x,parent_id.y,x,y)
            pos-=screen.sec*orbit_speed*sign(parent_id.spin);
            pos = ((pos % 1)+1)%1;
            shadow_angle=parent_id.orbit_angle;
            path_in_view=path_in_rectangle(x1,y1,x2,y2,orbit_path,parent_id.x,parent_id.y)
        }
        else
        {
            orphan=1;
            path_in_view=0;
            speed=orbit_speed*screen.sec*orbit_circumference*sign(-spin);
            direction=orbit_angle+90;
        }
    }
}

