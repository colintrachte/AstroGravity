/// @description draw_dot(x,y,radius,color1,color2,alpha1,alpha2)
/// @param x
/// @param y
/// @param radius
/// @param color1
/// @param color2
/// @param alpha1
/// @param alpha2
function draw_dot(x, y, radius, color1, color2, alpha1, alpha2) {
	//By Ground Effect Games
	draw_set_color(color1)
	draw_set_alpha(alpha1)
	draw_circle(x,y,radius,0)
	draw_set_color(color2)
	draw_set_alpha(alpha2)
	draw_circle(x,y,radius,1)
	draw_set_color(c_white)
	draw_set_alpha(1)



}
