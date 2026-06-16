/// @description draw_polygon(x,y,radius,# sides,angle,color1,color2,alpha1,alpha2)
/// @param x
/// @param y
/// @param radius
/// @param # sides
/// @param angle
/// @param color1
/// @param color2
/// @param alpha1
/// @param alpha2
function draw_polygon(x, y, radius, angle, color1, color2, alpha1, alpha2, arg8) {
	//by Ground Effect Games

	if (angle>=3)
	{
	    var i,side;

	    side=360/round(angle);
    
	    //change to pr_linestrip to debug
	    draw_primitive_begin(pr_trianglestrip)
	    for (i=color1-360;i<=color1;i+=side)
	    {
	        //middle circle of points
	        draw_vertex_color(x+lengthdir_x(radius,i),y+lengthdir_y(radius,i),alpha1,arg8)
	        //there is only one point in the center
	        draw_vertex_color(x,y,color2,alpha2)
	    }
	    draw_primitive_end();
	}



}
