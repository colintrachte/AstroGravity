if !orphan && path_in_view && camera.zoom<20
{
    draw_set_alpha(math_fade(camera.zoom,20,.5))
    draw_path_line(orbit_path,parent_id.x,parent_id.y)
    draw_set_alpha(1)
    //draw_path_ext(parent_id.x,parent_id.y,orbit_path,0,1,sqrt(orbit_radius),16,c_white,math_fade(camera.zoom,20,.5),0)
}

if in_view
{
    //draw_circle(x,y,radius,0)//debug
    if (camera.zoom<radius)
    {
        if (segments>7)
        {
            discovered=1;
            if camera.zoom>3
            {
                draw_planet(earth,water,ice,lava,atmo)
            }
            else
            {
                draw_planet_path(earth,water,ice,lava,atmo)
            }
            if rings
            {
                for (var i=0;i<rings;i+=1)
                {
                    draw_ring_shadowed(x,y,ring_radius[i],ring_radius[i]+ring_width[i],segments+5,ring_color[i],c_black,.7,.2,orbit_angle)
                }
            }
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

