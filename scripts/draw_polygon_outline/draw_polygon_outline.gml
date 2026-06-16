/// @description draw_polygon_outline(x,y,radius,# sides,angle,color,alpha)
/// @param x
/// @param y
/// @param radius
/// @param # sides
/// @param angle
/// @param color
/// @param alpha
function draw_polygon_outline(x, y, radius, angle, color, alpha, arg6) {
	//by Ground Effect Games

	if (angle>=3)
	{
	    var i,side;

	    side=360/round(angle);
    
	    //change to pr_linestrip to debug
	    draw_primitive_begin(pr_linestrip)
	    for (i=color-360;i<=color;i+=side)
	    {
	        draw_vertex_color(x+lengthdir_x(radius,i),y+lengthdir_y(radius,i),alpha,arg6)
	    }
	    draw_primitive_end();
	}



}
