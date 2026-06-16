/// @description draw_node(x,y,#sides,radius,color1,color2,alpha1,alpha2,branches,parent id)
/// @param x
/// @param y
/// @param #sides
/// @param radius
/// @param color1
/// @param color2
/// @param alpha1
/// @param alpha2
/// @param branches
/// @param parent id
function draw_node(x, y, sides, radius, color1, color2, alpha1, alpha2, branches, parent) {
	draw_set_color(color1)
	draw_line_width(x,y,parent.x,parent.y,branches+3)
	draw_polygon(x,y,radius,sides,direction,color1,color2,alpha1,alpha2)
	draw_set_color(c_white)
	draw_circle(x,y,radius/4,0)
	if branches
	{
	    for (var i=0;i<360;i+=360/branches)
	    {
	        draw_polygon(x+lengthdir_x(radius,direction+i),y+lengthdir_y(radius,direction+i),radius/3,sides,0,color1,color2,alpha1,alpha2)
	    }
	}



}
