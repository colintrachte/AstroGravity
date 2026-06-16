draw_set_color(c_black)
draw_set_alpha(.85)
draw_rectangle(0,0,__view_get( e__VW.WPort, 0 ),__view_get( e__VW.HPort, 0 ),0)
draw_set_alpha(.4)
draw_set_color(c_gray)
//left sidebar
draw_rectangle(0,0,margin[2],__view_get( e__VW.HPort, 0 ),0)
//right sidebar
draw_rectangle(__view_get( e__VW.WPort, 0 ),0,__view_get( e__VW.WPort, 0 )-margin[2],__view_get( e__VW.HPort, 0 ),0)
//header bar
//draw_rectangle(margin[2],0,view_wport-margin[2],margin/2,0)
//footer bar
//draw_rectangle(margin[2],view_hport,view_wport-margin[2],view_hport-margin/2,0)
draw_set_color(c_white)
//mirror line
draw_line_width(__view_get( e__VW.WPort, 0 )/2,0,__view_get( e__VW.WPort, 0 )/2,__view_get( e__VW.HPort, 0 ),3)
draw_set_alpha(1)
//header text
draw_text((__view_get( e__VW.WPort, 0 )/4) + margin[1],margin[4],string_hash_to_newline(header_left))
draw_text((__view_get( e__VW.WPort, 0 )*3/4) - margin[1],margin[4],string_hash_to_newline(header_right))
//footer text
draw_text((__view_get( e__VW.WPort, 0 )/4) + margin[1],__view_get( e__VW.HPort, 0 )-margin[4],string_hash_to_newline(footer_left))
draw_text((__view_get( e__VW.WPort, 0 )*3/4) - margin[1],__view_get( e__VW.HPort, 0 )-margin[4],string_hash_to_newline(footer_right))

if page
{
    draw_ship_grid(ship_grid,x,y,1,0,c_white,.85,weighting,weighting,0)
    draw_ship_grid(ship_grid,x,y,1,0,c_white,.3,0,0,0)
    draw_ship_grid(ship_grid,x,y,1,0,c_white,.3,1,1,0)
}
else
{
    draw_ship_list(points_list,x,y,.85)
}

