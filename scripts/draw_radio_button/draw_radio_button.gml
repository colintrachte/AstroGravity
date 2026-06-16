/// @description draw_radio_button(x,y,radius,selected)
/// @param x
/// @param y
/// @param radius
/// @param selected
function draw_radio_button(x, y, radius, selected) {
	draw_crescent(x+1,y+1,0,radius,radius,c_black,c_black,.6,0,-90)
	draw_crescent(x+1,y+1,0,radius,radius,c_white,c_black,.4,0,90)

	if selected
	{
	    draw_set_blend_mode(bm_add)
	    draw_crescent(x+1,y+1,1,radius/2,radius/2,c_white,c_black,.3,0,-90)
	    draw_star_small(x,y,radius*4,image_blend,1)
	    draw_set_blend_mode(bm_normal)
	    draw_crescent(x+1,y+1,1,radius/2,radius/2,c_black,c_black,.3,0,90)
	}
	else
	{
	    draw_set_blend_mode(bm_add)
	    draw_crescent(x+1,y+1,1,radius/2,radius/2,c_white,c_black,.3,0,-90)
	    draw_set_blend_mode(bm_normal)
	    draw_star_small(x,y,radius*4,c_black,.1)
	    draw_crescent(x+1,y+1,1,radius/2,radius/2,c_black,c_black,.3,0,90)
	}



}
