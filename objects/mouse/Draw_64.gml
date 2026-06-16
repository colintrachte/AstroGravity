x=window_mouse_get_x();
y=window_mouse_get_y();

draw_set_blend_mode(bm_max);

image_blend=c_white;
draw_point(x,y)

if mouse_check_button(mb_any)
{
    image_blend=color;
    draw_circle(x-1,y-1,2,0)
}

draw_hud_crosshairs(x,y+1,radius,radius*0.25,24,3,c_black,c_white,0,0.9)
draw_hud_crosshairs(x,y+1,radius,radius*0.5,28,3,c_black,image_blend,0,0.9)

draw_set_blend_mode(bm_normal);
//uncomment one of these to see statistic
//draw_text(x,y,string(x)+","+string(y))
//draw_text(x,y,string(instance_number(o_menu)))
//draw_text(x,y,string(instance_number(o_star)));
//draw_text(x,y,string(camera.zoom))
draw_reset()

