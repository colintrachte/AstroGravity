//see alarm 4 for intermittent step code
if (visible)
{
    var x1,y1,x2,y2;
    x1=__view_get( e__VW.XView, 0 )-diameter*5;
    y1=__view_get( e__VW.YView, 0 )-diameter*5;
    x2=__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+diameter*5;
    y2=__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )+diameter*5;
    in_view=point_in_rectangle(x,y,x1,y1,x2,y2);
    
    if (segments>7)
    {
        image_angle+=spin*screen.sec;
        path_rotate(path,-spin*screen.sec);
    }
    
    if !orphan
    {
        if aurora || raining
        {
            var len,dir;
            if aurora
            {
                if raining && choose(1,0)
                {
                    dir=rain_dir+random_normal(rain_sweep);
                }
                else
                {
                    dir=aurora_dir+aurora_sweep*(exp(-sqr(random(10)+5)*.5)/sqrt(6.26))/.4;
                }
            }
            else
            {
                dir=rain_dir+random_normal(rain_sweep);
            }
            len=radius*1.05;
            with instance_create(x+lengthdir_x(len,dir),y+lengthdir_y(len,dir),o_particle_rain)
            {
                scale=.1+random(.8);
                planet_id=other.id;
                length=1+random(4);
                dist=point_distance(x,y,planet_id.x,planet_id.y);
                dir=point_direction(x,y,planet_id.x,planet_id.y);
                dx=lengthdir_x(2,dir);
                dy=lengthdir_y(2,dir);
            }
        }
        if instance_exists(parent_id)
        {
            path_in_view=path_in_rectangle(x1,y1,x2,y2,orbit_path,parent_id.x,parent_id.y);
            if (orbit_radius>0)
            {
                orbit_speed=.05*path_get_speed(orbit_path,pos)/orbit_circumference
                x=parent_id.x+path_get_x(orbit_path,pos);
                y=parent_id.y+path_get_y(orbit_path,pos);
                orbit_angle=point_direction(parent_id.x,parent_id.y,x,y)
                pos-=screen.sec*orbit_speed*sign(parent_id.spin);
                pos = ((pos % 1)+1)%1;
            }
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

