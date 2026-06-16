/// @description draw_hud_polygraph(x,y,radius,sides,rotation,color1,color2,alpha1,alpha2)
/// @param x
/// @param y
/// @param radius
/// @param sides
/// @param rotation
/// @param color1
/// @param color2
/// @param alpha1
/// @param alpha2
function draw_hud_polygraph(x, y, radius, sides, rotation, color1, color2, alpha1, alpha2) {
	//draws a polygon graph background.
	//showing data on the graph must be done separately.

	//base colors
	draw_polygon(x,y,radius,sides,rotation,color1,c_black,alpha1,alpha2)
	draw_set_blend_mode(bm_add)
	draw_polygon(x,y,radius,sides,rotation,c_white,color2,alpha1,0)

	//these lines mark increments of 25%
	draw_polygon_outline(x,y,radius*.25,sides,rotation,color1,alpha1)
	draw_polygon_outline(x,y,radius*.5,sides,rotation,color1,alpha1)
	draw_polygon_outline(x,y,radius*.75,sides,rotation,color1,alpha1)
	draw_polygon_outline(x,y,radius,sides,rotation,color1,alpha1)



}
