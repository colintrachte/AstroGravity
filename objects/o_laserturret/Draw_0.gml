draw_self()
draw_set_blend_mode(bm_max)
draw_line_width_colour(x,y,mouse_x,mouse_y,2,c1,c_black)
draw_line_colour(x-1,y+1,mouse_x,mouse_y,c1,c_black)
draw_line_colour(x+1,y+1,mouse_x,mouse_y,c1,c_black)
draw_reset()

