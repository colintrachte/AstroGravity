if in_view
{
    //draw_circle_color(x,y,radius,c_black,c_black,0)//debug
    //if the star is big enough
    if (segments>9)
    {
        draw_sphere_ext(x,y,radius,segments,fx.texture[2],diameter,diameter,10,image_angle/3,0,c_white,c_white,c_white,1,1,0)
        draw_set_blend_mode(bm_add)
        draw_sphere_ext(x,y,radius,segments,fx.texture[2],-diameter,-diameter,10,image_angle/4,0,c_white,merge_color(c_white,image_blend,.5),image_blend,1,.8,0)
        draw_sphere_ext(x,y,radius*1.8,segments,fx.texture[3],-diameter*3.6,-diameter*3.6,10,image_angle/2,-spin,image_blend,image_blend,image_blend,0,1,0)
    }
    else//if the star is small, just draw an icon
    {
        draw_set_blend_mode(bm_add)
        draw_star(x,y,(6+2*dt)*camera.zoom,(16+12*dt)*camera.zoom,size_factor,c_white,color,1,0);
        draw_set_alpha(.1+dt/4)
        draw_circle_color(x,y,(32+12*dt)*camera.zoom,image_blend,c_black,0)
        draw_set_alpha(1)
        if dt && mouse_check_button_pressed(mb_left)
        {
            global.selected=id;
            global.selected_move=1;
        }
    }
    draw_set_blend_mode(bm_normal);
}

if selected
{
    draw_hud_target()
}

