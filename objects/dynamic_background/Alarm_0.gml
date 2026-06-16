/// @description intermittent step
alarm[0]=choose(1,update_speed);
backstar_detail = 11/(camera.zoom+7);
if instance_exists(o_star)
{
    glue_to(camera,0,0)
    if (instance_nearest(x,y,o_star)!=star_id)
    {
        star_id=instance_nearest(camera.x,camera.y,o_star);
        space_get_nebula(star_id);
        space_get_background_stars(star_id);
    }

    dist=point_distance(x,y,star_id.x,star_id.y);
    dir=point_direction(camera.x,camera.y,star_id.x,star_id.y);
    var r = star_id.system_radius*screen.height/360;
    if (dist<r)
    {
        //fade out the nebula when the camera is outside the solar system
        trans_alpha=((1+camera.zoom_min)/(1+camera.zoom))*(r-dist)/r;
    }
    else
    {
        trans_alpha=0;
    }
}

