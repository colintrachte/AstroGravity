if instance_exists(trail_object)
{
    trail_alarm0-=delta_time/1000000;
    if (trail_alarm0<=0)
    {
        image_angle=trail_object.image_angle;
        x=trail_object.x-lengthdir_x(trail_offset,image_angle)+trail_object.hspeed*trail_rate*60;
        y=trail_object.y-lengthdir_y(trail_offset,image_angle)+trail_object.vspeed*trail_rate*60;
        visible=trail_object.visible;
        trail_path_update(x,y,image_angle)
        trail_alarm0=trail_rate;
    }
}
else
{
    instance_destroy()
    exit;
}

