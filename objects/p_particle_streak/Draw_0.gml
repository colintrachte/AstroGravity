draw_set_alpha(image_alpha*max(1,scale))
draw_set_blend_mode(bm_add)
draw_line_width_colour(x,y,x+hspeed*2,y+vspeed*2,image_alpha*scale,image_blend,c_black)
draw_line_width_colour(x,y,x-hspeed*2,y-vspeed*2,image_alpha*scale,image_blend,c_black)
draw_set_alpha(1)
draw_set_blend_mode(bm_normal)

