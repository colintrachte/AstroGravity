/// @description draw_circle_shadow(x,y,radius,# polygons,color1,color2,alpha1,alpha2,angle)
/// @param x
/// @param y
/// @param radius
/// @param # polygons
/// @param color1
/// @param color2
/// @param alpha1
/// @param alpha2
/// @param angle
function draw_circle_shadow(x, y, radius, color1, color2, alpha1, alpha2, angle, arg8) {
	//by Ground Effect Games
	//to understand how this works, you need to know polar coordinates

	//only draw if we have enough triangles to do it with.
	if (color1>=3)
	{
	    var side,shadow;
    
	    //The number of sides should never exceed the circumference of the circle.
	    //also, we round the number of sides to minimize loss in precision of the drawing.
	    side=360/round(color1);
    
	    //change to pr_linestrip to debug
	    draw_primitive_begin(pr_trianglestrip)
	    for (var i=arg8-360;i<=arg8;i+=side)
	    {
	        shadow=1-sqr(angle_difference(arg8,i)/180);
	        draw_vertex_color(x+lengthdir_x(radius,i),y+lengthdir_y(radius,i),alpha1,shadow*angle)
	        draw_vertex_color(x,y,color2,alpha2)
	    }
	    draw_primitive_end();
	}



}
