if !orphan && path_in_view && camera.zoom<12
{
    draw_path_ext(parent_id.x,parent_id.y,orbit_path,0,1,sqrt(orbit_radius),12,c_white,math_fade(camera.zoom,12,.5),0)
}

if in_view
{
    //draw_circle(x,y,radius,0)//debug
    if (camera.zoom<radius)
    {
        if (segments>5)
        {
            draw_moon()
        }
        else
        {
            draw_dot(x,y,radius,image_blend,c_white,1,1)
        }
    }
}

if selected
{
    draw_hud_target()
}

